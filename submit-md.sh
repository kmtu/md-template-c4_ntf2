if [[ $# == 0 ]]; then
  echo "no dependence"
  t2sub -W group_list=t2g-hp150137 -q S -et 0 -l walltime=00:30:00 -l select=8:mpiprocs=12:mem=48gb -l place=scatter -N md-nve.run -m ae -M kmtu@esicb.kyoto-u.ac.jp run_md.sh
elif [[ $# == 1 ]]; then
  echo "submit dependent job"
  t2sub -W depend=afterok:$1 -W group_list=t2g-hp150137 -q S -et 0 -l walltime=00:30:00 -l select=8:mpiprocs=12:mem=48gb -l place=scatter -N md-nve.run -m ae -M kmtu@esicb.kyoto-u.ac.jp run_md.sh
else
  echo "Usage: $0 [<dependent jobid>]"
  exit 1;
fi
