#!/bin/bash

# set the number of nodes and processes per node. We are running one process on a single node
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1

##SBATCH --mem=50Gb
# uncomment if NUM_QUBITS - log2(NUM_NODES) > 30
#SBATCH --mem=100Gb

# set max wallclock time
#SBATCH --time=01:00:00

# set name of job
#SBATCH --job-name QUEST

# set queue
#SBATCH --partition=compute
#sbatch --reservation=nqit

NUM_QUBITS=31
EXE=demo
export OMP_NUM_THREADS=16

module purge
module load mvapich2

mpirun $MPI_HOSTS ./$EXE $NUM_QUBITS
