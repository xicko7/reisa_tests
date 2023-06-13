import time
import numpy as np
from  reisa import Reisa # Mandatory import
import os

# The user can decide which task is executed on each level of the following tree
'''
   [p0 p1 p2 p3]-->[p0 p1 p2 p3]      # One task per process per iteration (we can get previous iterations data)
    \  /   \  /     \  /  \  /
     \/     \/       \/    \/
     iteration 0--> iteration 1 --> [...] --> result
    # One task per iteration (typically gathering the results of all the actors in that iteration)
    # We can get the result of the previous iterations
'''

# Get infiniband address
address = os.environ.get("RAY_ADDRESS").split(":")[0]
# Starting reisa (mandatory)
handler = Reisa("config.yml", address)
max = handler.iterations
    
# Process-level analytics code
def process_func(rank: int, i: int, queue):
    # "queue" will be the available data for "rank" process since the simulation has started (from iteration 0 to "i")
    # We must take into acount that some data will be erased to free memory
    gt = np.array(queue[-5:])
    c0 = 2. / 3.
    return np.average(c0 / 1 * (gt[3] - gt[1] - (gt[4] - gt[0]) / 8.))

# Iteration-level analytics code
def iter_func(i: int, current_results, previous_iterations):
    if i == max-1:
        res = []
        for i in previous_iterations.keys():
            res.append(previous_iterations[i]) # get the data with square brackets
        
        res.append(np.average(current_results[:]))
        return np.average(np.array(res))
    else:
        return np.average(current_results[:])

# The iterations that will be executed (from 0 to end by default), in this case we will need 4 available timesteps
iterations = [i for i in range(4, max)]

# Launch the analytics (blocking operation), kept iters paramerter means the number of iterations kept in memory before the current iteration
result = handler.get_result(process_func, iter_func, selected_iters=iterations, kept_iters=5, timeline=False)

# Write the results
with open("results.log", "a") as f:
    f.write("\nResult: "+str(result[max-1])+".\n")

handler.shutdown()