#!/bin/bash
#PJM -g gh24
#PJM -L "rscgrp=short"
#PJM -L "node=1"
#PJM -L "elapse=06:00:00"
#PJM -m e
#PJM --mail-list kmtu@esicb.kyoto-u.ac.jp

module load PHDF5

$HOME/local/decond/fortran/out/combine_eng ermod-*/soln/engtraj.h5
