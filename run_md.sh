#!/bin/sh
#PJM -g gh24
#PJM -L "rscgrp=short"
#PJM -L "node=8"
#PJM -L "elapse=02:00:00"
#PJM --mpi "proc=32"
#PJM -m e
#PJM --mail-list kmtu@esicb.kyoto-u.ac.jp

GMDIR=/home/f24005/local/gromacs-5.1/bin
GMX=$GMDIR/gmx_d
GROMPP="$GMX grompp"
TPBCONV="$GMX convert-tpr"
MDRUN=$GMDIR/mdrun_mpi_d

TOP=../../C4mimNTf2
PREV=md-npt
STAGE=md-nve

MAXH=1
NPME=4


$GROMPP -f ../${STAGE}.mdp -c $PREV.tpr -t $PREV.cpt -p $TOP.top -o $STAGE.tpr 
mpiexec $MDRUN -s $STAGE.tpr -deffnm $STAGE -npme $NPME -maxh $MAXH #-cpi $STAGE.cpt

