#!/bin/bash
AIO_NUM_THREADS=2 OMP_NUM_THREADS=2 TF_CPP_MIN_LOG_LEVEL=3  AIO_PROCESS_MODE=0 numactl --physcpubind=0-1 jupyter notebook --allow-root --port 8882
