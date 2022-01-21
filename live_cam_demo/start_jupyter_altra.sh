#!/bin/bash
AIO_NUM_THREADS=6 OMP_NUM_THREADS=6 TF_CPP_MIN_LOG_LEVEL=3  AIO_PROCESS_MODE=1 numactl --physcpubind=0-5 jupyter notebook --allow-root --port 8890
