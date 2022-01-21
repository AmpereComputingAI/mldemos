#!/bin/bash
AIO_NUM_THREADS=128 OMP_NUM_THREADS=128 TF_CPP_MIN_LOG_LEVEL=3 AIO_PROCESS_MODE=0 jupyter notebook --allow-root --port 8888
