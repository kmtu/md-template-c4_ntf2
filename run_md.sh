#!/bin/sh
cd ${PBS_O_WORKDIR} 
NPROCS=`wc -l <$PBS_NODEFILE`

GMDIR=$HOME/local/gromacs-5.1/bin
GMX=$GMDIR/gmx_d
GROMPP="$GMX grompp"
TPBCONV="$GMX convert-tpr"
MDRUN=$GMDIR/mdrun_mpi_d

TOP=../../C4mimNTf2
PREV=md-npt
STAGE=md-nve

MAXH=1
NPME=-1

$GROMPP -f ../${STAGE}.mdp -c $PREV.tpr -t $PREV.cpt -p $TOP.top -o $STAGE.tpr 
mpirun -n $NPROCS -hostfile $PBS_NODEFILE \
$MDRUN -s $STAGE.tpr -deffnm $STAGE -npme $NPME -maxh $MAXH #-cpi $STAGE.cpt

