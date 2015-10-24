#!/bin/sh
#PJM -g gh24
#PJM -L "rscgrp=short"
#PJM -L "node=72"
#PJM -L "elapse=06:00:00"
#PJM --mpi "proc=1152"
#PJM -m e
#PJM --mail-list kmtu@esicb.kyoto-u.ac.jp

module load PHDF5

ermod=/home/f24005/local/ermod-engtraj/bin/ermod

mpiexec $ermod
