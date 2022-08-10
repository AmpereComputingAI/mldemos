#!/bin/bash

docker run \
  -it --init \
  --privileged=true \
  -e "DISPLAY=$DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --network host \
  --ipc host \
  yolov5-pytorch-aio-demo:1.0

# -v $HOME/yolo-demo:/workspace/yolo-demo \
