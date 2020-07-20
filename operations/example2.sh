ccm stress \
    user profile=$1 \
    n=2000 \
    ops\(insert=3,read1=1,read2=2\) \
    no-warmup \
    cl=$2 \
    -log  file=logs/log_$2/log_$2_$3_$(date +'%s').log no-summary