#!/bin/bash

set -v

#export AIO_DEBUG_MODE=4

imgsize=640
i=yolov5n
echo "Converting $i.pt"
python export.py --weights $i.pt --include torchscript
mv $i.torchscript $i-frozen-$imgsize.torchscript

exit

for i in yolov5n yolov5s yolov5m yolov5l yolov5x # P5 (imgsize=640)
do
	echo "Converting $i.pt"
	python export.py --weights $i.pt --include torchscript
	mv $i.torchscript $i-frozen-$imgsize.torchscript
done

imgsize=1280
for i in yolov5n6 yolov5s6 yolov5m6 yolov5l6 yolov5x6 # P6 (imgsize=1280)
do
	echo "Converting $i.pt"
	python export.py --weights $i.pt --include torchscript --imgsz $imgsize
	mv $i.torchscript $i-frozen-$imgsize.torchscript
done
