#!/bin/bash
DLS_NUM_THREADS=48 OMP_NUM_THREADS=48 TF_CPP_MIN_LOG_LEVEL=3  DLS_PROCESS_MODE=0 numactl --physcpubind=0-47 jupyter notebook --allow-root --port 8880
