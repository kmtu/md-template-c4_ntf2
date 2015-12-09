#!/bin/sh
#PJM --rsc-list "node=128"
#PJM --rsc-list "rscgrp=small"
#PJM --rsc-list "elapse=10:00:00"
#PJM --name run_dec
#PJM --mpi "shape=128"
#PJM --mpi "proc=1024"
#PJM -s
#
#PJM -m e
#PJM --mail-list kmtu@esicb.kyoto-u.ac.jp
#
#PJM --stg-transfiles all
#
#PJM --vset decond_path=/volume2/home/hp150268/k02368/opt/decond
#PJM --vset mdpath=.
#PJM --vset mol1=c4
#PJM --vset mol2=ntf2
#PJM --vset top=C4mimNTf2.cpp.top
#PJM --vset stage=md-nve
#PJM --stgin "${decond_path}/bin/decond ./"
#PJM --stgin "${mdpath}/ermod-${mol1}/soln/engtraj.h5 ./engtraj-${mol1}.h5"
#PJM --stgin "${mdpath}/ermod-${mol2}/soln/engtraj.h5 ./engtraj-${mol2}.h5"
#PJM --stgin "${mdpath}/../../${top} ./"
#PJM --stgin "${mdpath}/${stage}.trr ./"
#PJM --stgin "${mdpath}/${stage}.log ./"
#
#PJM --stgout "corr.c5 ./"

. /work/system/Env_base

trrfile=md-nve.trr
topfile=C4mimNTf2.cpp.top
logfile=md-nve.log
engfile="engtraj-*.h5"
decond=./decond
mpiexec $decond $trrfile $logfile 50000 -pa $topfile c4 1 ntf2 5401 -ed $engfile -sd
