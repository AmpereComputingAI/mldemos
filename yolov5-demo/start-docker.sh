#!/bin/bash

docker run \
  -it --init \
  --privileged=true \
  -e "DISPLAY=$DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $HOME/yolo-demo:/workspace/yolo-demo:ro \
  --network host \
  --ipc host \
  yolov5-pytorch-aio-demo:rev4

# -v $HOME/yolo-demo:/workspace/yolo-demo \
