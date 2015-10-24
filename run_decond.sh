#!/bin/bash
#PJM -g gh24
#PJM -L "rscgrp=short"
#PJM -L "node=72"
#PJM -L "elapse=06:00:00"
#PJM --mpi "proc=1152"
#PJM -m e
#PJM --mail-list kmtu@esicb.kyoto-u.ac.jp

module load PHDF5 fftw

ECONDDIR=/home/f24005/local/decond/fortran/out

trrfile=md-nve.trr
topfile=../../C4mimNTf2.cpp.top
logfile=md-nve.log
engfile="ermod-*/soln/engtraj.h5"
decond=$ECONDDIR/decond
mpiexec $decond $trrfile $logfile 50000 -pa $topfile c4 1 ntf2 5401 -ed $engfile -sd -d 24 48
