#!/bin/bash

if [ $# != 1 ]
then
	echo "Usage: $0 <tag>"
	echo "recommended, tag = \`git tag | head -1\`"
	exit
fi

name="yolov5-pytorch-aio-demo"
tag=$1

docker build -t $name:$tag .
