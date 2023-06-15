#!/bin/bash

mkdir logs 2>/dev/null

grep -h DATA: outputs/**/reisa.log | awk '{print $2}' > logs/data.log;
grep -h ITERATIONS: outputs/**/reisa.log | awk '{print $2}' > logs/iterations.log;
grep -h MPI: outputs/**/reisa.log | awk '{print $2}' > logs/mpi.log;
grep -h MPI_PER_NODE: outputs/**/reisa.log | awk '{print $2}' > logs/mpi_per_node.log;
grep -h CORES_IN_SITU: outputs/**/reisa.log | awk '{print $2}' > logs/cores_in_situ.log;
grep -h WORKERS: outputs/**/reisa.log | awk '{print $2}' > logs/workers.log;
grep -h CPUS_PER_WORKER: outputs/**/reisa.log | awk '{print $2}' > logs/cpus_per_worker.log;
grep -h SIMULATION_TIME: outputs/**/reisa.log | awk '{print $2}' > logs/simulation_time.log;
grep -h ANALYTICS_TIME: outputs/**/reisa.log | awk '{print $2}' > logs/analytics_time.log;
grep -h SLURM_JOB_ID: outputs/**/reisa.log | awk '{print $2}' > logs/slurm_job_id.log;

paste  logs/slurm_job_id.log logs/data.log logs/iterations.log logs/mpi.log logs/cores_in_situ.log logs/workers.log logs/cpus_per_worker.log logs/simulation_time.log logs/analytics_time.log logs/mpi_per_node.log > logs/log.log