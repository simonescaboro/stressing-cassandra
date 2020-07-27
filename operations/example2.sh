#!/bin/sh
ccm stress \
    user profile=./operations/test_profiles/stress-example.yaml \
    n=2000 \
    ops\(insert=3,read1=1,read2=2\) \
    no-warmup \
    cl=$1 \
    -log  file=logs/log_$1/log_$1_$2_$(date +'%s').log no-summary