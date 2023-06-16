#!/bin/bash
spack load pdiplugin-pycall@1.6.0 pdiplugin-mpi@1.6.0 pdiplugin-deisa py-distributed py-bokeh;
module load gcc/11.2.0/gcc-4.8.5 openmpi/4.1.1/gcc-11.2.0;

START_DIR=$PWD

# cd E1/DEISA; ./exp.sh; cd $START_DIR;
cd E1/REISA; ./exp.sh; cd $START_DIR;

# cd E2/DEISA; ./exp.sh; cd $START_DIR;
cd E2/REISA; ./exp.sh; cd $START_DIR;

# cd E3/DEISA; ./exp.sh; cd $START_DIR;
cd E3/REISA; ./exp.sh; cd $START_DIR;

