#!/bin/bash
DLS_NUM_THREADS=64 OMP_NUM_THREADS=64 TF_CPP_MIN_LOG_LEVEL=3 DLS_PROCESS_MODE=1 jupyter notebook --allow-root --port 8890
