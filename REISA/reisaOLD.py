from datetime import datetime
from math import ceil
import itertools
import yaml
import time
import ray
import sys
import gc
import os

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

# "Background" code for the user

# This class will be the key to able the user to deserialize the data transparently
class RayList(list):
    def __getitem__(self, index): # Square brackets operation to obtain the data behind the references.
        item = super().__getitem__(index)
        if isinstance(index, slice):
            return ray.get(RayList(item))
        else:
            return ray.get(item)

# Class to manage actor answers, we need to make ray.get() to obtain a RayList
class ActorAnswerList(list):
    def __getitem__(self, index): # Square brackets operation to obtain the data behind the references.
        tmp = ray.get(self)
        return RayList(list(itertools.chain.from_iterable(tmp)))[index]

# This class will be the key to able the user to deserialize the data transparently
class RayDict(dict):
    def __getitem__(self, key): # Square brackets operation to obtain the data behind the references.
        if isinstance(key, slice):
            return ray.get(RayList(self.values()))
        else:
            item = super().__getitem__(key)
            return ray.get(item)

class Reisa:
    def __init__(self, file, address):
        self.iterations = 0
        self.mpi_per_node = 0
        self.mpi = 0
        self.workers = 0
        self.actors = list()
        
        # Init Ray
        if os.environ.get("REISA_DIR"):
            ray.init("ray://"+address+":10001", runtime_env={"working_dir": os.environ.get("REISA_DIR")})
        else:
            ray.init("ray://"+address+":10001", runtime_env={"working_dir": os.environ.get("PWD")})
       
        # Get the configuration of the simulatin
        with open(file, "r") as stream:
            try:
                data = yaml.safe_load(stream)
                self.iterations = data["MaxtimeSteps"]
                self.mpi_per_node = data["mpi_per_node"]
                self.mpi = data["parallelism"]["height"] * data["parallelism"]["width"]
                self.workers = data["workers"]
            except yaml.YAMLError as e:
                eprint(e)

        return
    
    def get_result(self, process_task, iter_task, selected_iters=None, kept_iters=None, timeline=False):
            
            start = 0 # Time variable
            count = 0 # Iteratipn step variable
            max_tasks = ray.available_resources()['compute']
            
            waiting_interval = 2
            
            process_task = ray.remote(max_retries=-1, resources={"compute":1}, scheduling_strategy="DEFAULT")(process_task)
            iter_task = ray.remote(max_retries=-1, resources={"compute":1, "transit":0.5}, scheduling_strategy="DEFAULT")(iter_task)

            if selected_iters is None:
                selected_iters = [i for i in range(self.iterations)]
            if kept_iters is None:
                kept_iters = self.iterations
            
            results = list()
            actors = self.get_actors()
            previous = RayDict()
            actor_references = [ray.put(None) for actor in actors]
            

            start = time.time() # Measure time
            for count, i in enumerate(selected_iters):
                # Ask each actor to execute "mpi_per_node" processes_task
                actor_references = [actor.trigger.remote(process_task, i, RayList, kept_iters, actor_references[j]) for j, actor in enumerate(actors)]
                actors_answers = ActorAnswerList(actor_references) # actor_references are references of RayLists
                iter_task_ref = iter_task.remote(i, actors_answers, previous)
                previous[i] = iter_task_ref # Save the iteration to future tasks
                results.append(iter_task_ref) # Save the iteration task reference
                
                # eprint("["+str(datetime.now())+ "] Sent ["+str(i)+"]")
                
                if waiting_interval==0 or (count % waiting_interval == 0 and count >= waiting_interval):
                    pressure = 100
                    
                    status = ray.available_resources()
                    # eprint("["+str(datetime.now())+"] Waiting for ",count-waiting_interval," in iteration ",i)
                    ray.wait([results[count-waiting_interval]], num_returns=1) # Wait to avoid bottlenecks

                    if 'compute' in status:
                        pressure = max_tasks/status['compute']
                        
                    if count > 2:
                        if pressure < 75:
                            waiting_interval = waiting_interval+1
                        elif waiting_interval > 0:
                            waiting_interval = waiting_interval-1

            ray.wait(results, num_returns=len(results)) # Wait for the results
            eprint("{:<21}".format("EST_ANALYTICS_TIME:") + "{:.5f}".format(time.time()-start) + " (avg:"+"{:.5f}".format((time.time()-start)/self.iterations)+")")

            tmp = ray.get(results)

            output = {} # Output dictionary
            for i, _ in enumerate(selected_iters):
                if tmp[i] is not None:
                    output[selected_iters[i]] = tmp[i]
            
            if timeline:
                ray.timeline(filename="timeline-client.json")

            return output

    # Get the actors created by the simulation
    def get_actors(self):
        timeout = 60
        start_time = time.time()
        error = True
        self.actors = list()
        while error:
            try:
                for rank in range(0, self.mpi, self.mpi_per_node):
                    self.actors.append(ray.get_actor("ranktor"+str(rank), namespace="mpi"))
                error = False
            except Exception as e:
                self.actors=list()
                end_time = time.time()
                elapsed_time = end_time - start_time
                if elapsed_time >= timeout:
                    raise Exception("Cannot get the Ray actors. Client is exiting")
            time.sleep(1)

        return self.actors

    # Erase iterations from simulation memory
    def shutdown(self):
        ray.shutdown()