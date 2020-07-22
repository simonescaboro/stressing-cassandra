#!/bin/sh
ccm stress \
    user profile=../examples/stress-example.yaml \
    n=1000 \
    ops\(read1=3\) \
    no-warmup \
    cl=$1 \
    -log  file=logs/log_$1/log_$1_$2_$(date +'%s').log no-summary