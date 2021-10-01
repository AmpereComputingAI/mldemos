#!/bin/bash

pip install jupyterlab

export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libGLdispatch.so.0.0.0

pip install opencv-python==4.1.1.26
pip install lxml
pip install tqdm

# yolov3
wget https://pjreddie.com/media/files/yolov3.weights -O data/yolov3.weights
python convert.py --weights ./data/yolov3.weights --output ./checkpoints/yolov3.tf

# yolov3-tiny
wget https://pjreddie.com/media/files/yolov3-tiny.weights -O data/yolov3-tiny.weights
python convert.py --weights ./data/yolov3-tiny.weights --output ./checkpoints/yolov3-tiny.tf --tiny

# Generate license key for DLS
python3 -c "from datetime import date as d; x=(d.today() - d(1996, 5, 19)).days + 60; print(3**39+5**20*x)" >> /root/.dls_licence.key
