ccm stress \
    user profile=$1 \
    n=1000 \
    ops\(read1=3\) \
    no-warmup \
    cl=$2 \
    -log  file=logs/log_$2/log_$2_$3_$(date +'%s').log no-summary