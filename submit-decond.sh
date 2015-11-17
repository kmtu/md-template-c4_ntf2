if [[ $# == 0 ]]; then
  echo "no dependence"
  t2sub -W group_list=t2g-hp150137 -q S -et 1 -l walltime=03:00:00 -l select=64:mpiprocs=12:mem=48gb -l place=scatter -N decond.run -m ae -M kmtu@esicb.kyoto-u.ac.jp run_decond.sh
elif [[ $# == 2 ]]; then
  echo "submit dependent job"
  t2sub -W depend=afterok:$1,afterok:$2 -W group_list=t2g-hp150137 -q S -et 1 -l walltime=03:00:00 -l select=64:mpiprocs=12:mem=48gb -l place=scatter -N decond.run -m ae -M kmtu@esicb.kyoto-u.ac.jp run_decond.sh
else
  echo "Usage: $0 [<dependent jobid-1> <dependent jobid-2>]"
  exit 1;
fi
