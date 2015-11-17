if [[ $# == 0 ]]; then
  t2sub -W group_list=t2g-hp150137 -q S -et 1 -l walltime=8:00:00 -l select=64:mpiprocs=12:mem=48gb -l place=scatter -N ermod-c4.run -m abe -M kmtu@esicb.kyoto-u.ac.jp run_ermod.sh
elif [[ $# == 1 ]]; then
  t2sub -W depend=afterok:$1 -W group_list=t2g-hp150137 -q S -et 1 -l walltime=8:00:00 -l select=64:mpiprocs=12:mem=48gb -l place=scatter -N ermod-c4.run -m abe -M kmtu@esicb.kyoto-u.ac.jp run_ermod.sh
else
  echo "Usage: $0 [<dependent job-id>]"
  exit 1;
fi
