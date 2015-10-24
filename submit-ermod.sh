#!/bin/bash

mols=(c4 ntf2)

for mol in ${mols[*]};
do
  cd ermod-${mol}/soln &&\
  pjsub run_ermod.sh &&\
  sleep 2s
  cd ../..
done
