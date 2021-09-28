#!/bin/bash
DLS_NUM_THREADS=4 OMP_NUM_THREADS=4 TF_CPP_MIN_LOG_LEVEL=3 DLS_PROCESS_MODE=0 numactl --physcpubind=0-3 jupyter notebook --allow-root --port 8888
