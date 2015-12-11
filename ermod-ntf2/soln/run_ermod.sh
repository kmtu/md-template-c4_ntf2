#/bin/bash -x
#PJM --rsc-list "node=64"
#PJM --rsc-list "elapse=3:00:00"
#PJM --name er-ntf2
#PJM --mpi "shape=64"
#PJM --mpi "proc=512"
#PJM -s
#
#PJM --stg-transfiles all
#
#PJM --vset path=../../
#PJM --vset traj=md-nve
#PJM --stgin "/home/hp150268/k02368/opt/ermod-engtraj/ermod-libexec.tar.gz ./"
#PJM --stgin "/home/hp150268/k02368/opt/ermod-engtraj/bin/ermod ./"
#
#PJM --stgin "${path}${traj}.trr ./"
#PJM --stgin "MDinfo ./"
#PJM --stgin "MolPrm1 ./"
#PJM --stgin "SltInfo ./"
#PJM --stgin "parameters_er ./"
#
#PJM --stgout "*.tt ./"
#PJM --stgout "engsln.* ./"
#PJM --stgout "weight_soln ./"
#PJM --stgout "engtraj.h5 ./"
#
#PJM -m e
#PJM --mail-list kmtu@esicb.kyoto-u.ac.jp

. /work/system/Env_base
#
ln -sf md-nve.trr HISTORY  # the filename defined above as traj needs to be used
tar xzf ermod-libexec.tar.gz
export ERMOD_PLUGINS="libexec/ermod"
mpiexec ./ermod
