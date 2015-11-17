#!/bin/sh
cd ${PBS_O_WORKDIR} 
NPROCS=`wc -l <$PBS_NODEFILE`

ermod=/home/usr4/15IH0431/local/ermod-0.3.2-engtraj-0.4.0/bin/ermod

mpirun -n $NPROCS -hostfile $PBS_NODEFILE $ermod 

