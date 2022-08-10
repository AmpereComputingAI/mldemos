#!/bin/bash

name="yolov5-pytorch-aio-demo"
tag="rev4"

docker build -t $name:$tag .
