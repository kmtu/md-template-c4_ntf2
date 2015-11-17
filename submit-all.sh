#!/bin/bash

mols=(c4 ntf2)
mols_len=${#mols[*]}

#------ md --------
md_job=$(./submit-md.sh | tail -n 1) &&\
sleep 2s &&\
echo "md_job: ${md_job}" &&\
#------ ermod --------
for (( i=0; i<${mols_len}; i++ ));
do
  cd ermod-${mols[$i]}/soln &&\
  eval ermod_jobs[$i]=$(./submit.sh ${md_job} | tail -n 1) &&\
  cd ../.. &&\
  sleep 2s
done &&\
echo "ermod_jobs: ${ermod_jobs[*]}" &&\
#------ decond --------
eval decond_job=$(./submit-decond.sh ${ermod_jobs[*]} | tail -n 1) &&\
echo "decond_job: $decond_job"
