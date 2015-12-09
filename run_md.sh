#!/bin/sh
#PJM --rsc-list "node=16"
#PJM --rsc-list "rscgrp=small"
#PJM --rsc-list "elapse=03:00:00"
#PJM --name run_md-nve
#PJM --mpi "shape=16"
#PJM --mpi "proc=128"
#PJM -s
#
#PJM --stg-transfiles all
#
#PJM --vset gromacs_path=/volume2/home/hp150268/k02368/opt/gromacs-5.1.1/
#PJM --vset mdpath=/volume41/data/hp150268/k02368/kmtu/C4mimNTf2-Ludwig-216-2015/3-nve/md99
#PJM --vset top=C4mimNTf2.top
#PJM --vset prev=md-npt
#PJM --vset stage=md-nve
#
#PJM --stgin "${gromacs_path}/bin/gmx_d ./"
#PJM --stgin "${gromacs_path}/bin/mdrun_mpi_d ./"
#PJM --stgin "${gromacs_path}/gmxtop.tgz ./"
#PJM --stgin "${mdpath}/../../${top} ./"
#PJM --stgin "${mdpath}/../${stage}.mdp ./"
#PJM --stgin "${mdpath}/${prev}.tpr ./"
#PJM --stgin "${mdpath}/${prev}.cpt ./"
#
#PJM --stgout "mdout.mdp ./"
#PJM --stgout "${stage}.* ./"
#PJM -m e
#PJM --mail-list kmtu@esicb.kyoto-u.ac.jp

. /work/system/Env_base
export GMXLIB="./share/gromacs/top"
grompp="./gmx_d grompp"
mdrun="./mdrun_mpi_d"

tar -zxvf ./gmxtop.tgz

top=C4mimNTf2.top
prev=md-npt
stage=md-nve

maxh=3
npme=8

$grompp -f $stage.mdp -c $prev.tpr -t $prev.cpt -p $top -o $stage.tpr
mpiexec $mdrun -deffnm $stage -npme $npme -maxh $maxh #-cpi $stage.cpt
