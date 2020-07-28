
N_NODES=0;
DEFF_VALUE=0;

function printHelp {
    printf "\nIn order to create a new cluster, you must use these two parameters at the same time:\n"
    printf "\t-n=<number of nodes> | --nodes=<number of nodes>\n"
    printf "\t-s=<cluster name> | --start=<cluster name>\n"
    printf "To delete the entire cluster use:\n"
    printf "\t-d=<cluster name> | --delete=<cluster name>\n"
    printf "To manage the cluster (remove single nodes, execute cql queries, etc), use ccm commands directly.\n"
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
                        printf "Creating cluster..\n Name: ${arg#*=}\n Number nodes: ${N_NODES}\n"
                            ccm create ${arg#*=} -v 3.11.5 -n $N_NODES
                            ccm start
                    else
                        printf "Missing -n parameter\n"
                    fi
                    shift
                    ;;
                -d=*|--delete=*)
                        printf "Removing cluster: ${arg#*=}\n"
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

