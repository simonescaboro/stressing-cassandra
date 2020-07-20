#!/bin/sh
N_NODES=0;
DEFF_VALUE=0;
for arg in "$@"
do
	case $arg in
		-n=*|--nodes)
			N_NODES=${arg#*=}
			shift
			;;
		-s=*|--start=*)
			if [ $N_NODES != $DEFF_VALUE ]; then
				echo "Creating cluster..\n Name: ${arg#*=}\n Number nodes: ${N_NODES}"
			       	ccm create ${arg#*=} -v 3.11.5 -n $N_NODES
			else
				echo "Missing -n parameter"
			fi
			shift
			;;
		-d=*|--delete=*)
                echo "Removing cluster: ${arg#*=}"
                ccm remove ${arg#*=}
			shift
			;;
	esac
done

