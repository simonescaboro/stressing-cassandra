#!/bin/sh
N_NODES=0;
DEFF_VALUE=0;

function printHelp {
    echo "\nIn order to create a new cluster, you must use these two parameters at the same time:"
    echo "\t-n=<number of nodes> | --nodes=<number of nodes>"
    echo "\t-s=<cluster name> | --start=<cluster name>"
    echo "To delete the entire cluster use:"
    echo "\t-d=<cluster name> | --delete=<cluster name>"
    echo "To manage the cluster (remove single nodes, execute cql queries, etc), use ccm commands directly.\n"
}

if [ -z "$1" ]
    then
        printHelp
    else
        for arg in "$@"
        do
            case $arg in
                -n=*|--nodes=*)
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
                -h|--help)
                    printHelp
                    shift
                    ;;
            esac
        done
fi

