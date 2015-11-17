#!/bin/sh
cd ${PBS_O_WORKDIR} 
NPROCS=`wc -l <$PBS_NODEFILE`

ECONDDIR=/home0/usr4/15IH0431/local/decond/fortran/out

trrfile=md-nve.trr
topfile=../../C4mimNTf2.cpp.top
logfile=md-nve.log
engfile="ermod-*/soln/engtraj.h5"
decond=$ECONDDIR/decond
mpirun -n $NPROCS -hostfile $PBS_NODEFILE $decond $trrfile $logfile 50000 -pa $topfile c4 1 ntf2 5401 -ed $engfile -sd -d 48 16
