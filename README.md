# stressing-cassandra
## Installation
In order to use these scripts, you have to install ccm (Cassandra Cluster Manager). A useful guide can he found [here](https://academy.datastax.com/planet-cassandra/getting-started-with-ccm-cassandra-cluster-manager).
After installing ccm, clone and extract this repositoy into ccm directory.
## Execution
`init-cluster.sh` helps you to initialize a cluster. Use `-h`parameter to find out the necessary parameters.
Run 
<center>

 `stress-test-ccm.sh stress-query-file.sh n`

</center> 

to execute a stress test using the query specified in `stress-query-file.sh` (in "operations" folder). The argument `n`represents the number of iteration for each consistency level (ONE, TWO, QUORUM, ALL). For example, running `stress-test-ccm.sh example1.sh 6` the file [example1.sh](operations/example1.sh) will be executed six times for each consistency level.

The first argument of `stress-test-ccm.sh` might be `None` if `stress-query-file.sh` does not use *user* mode for stress.

## Stress results
The results will be saved in *logs* folder. For each consistency level there is a separate subfolder (log_ONE, log_TWO, log_QUORUM, log_ALL).

In order to not delete the log files of past tests, each log file name has this format: `log_n_TIMESTAMP.log`, where *n* is the iteration number, and *TIMESTAMP* is the operation timestamp (to approximatly distinguish each test).