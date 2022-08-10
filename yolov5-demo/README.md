# Yolov5 demo

YOLOv5 is a family of object detection architectures and models
pretrained on the COCO dataset.

## Reference
https://github.com/ultralytics/yolov5

## Starting the docker
> $ docker run -it --init --privileged=true -e "DISPLAY=$DISPLAY" \\  
          -v /tmp/.X11-unix:/tmp/.X11-unix:ro \\  
          --network host --ipc host \\  
          yolov5-pytorch-aio-demo:rev4

## Run the demo
> $ python app.py

Running on local URL:  http://127.0.0.1:7860/  
Connected (version 2.0, client OpenSSH_7.6p1)  
Authentication (publickey) successful!  
Running on public URL: https://25836.gradio.app  

Open the browser and type in the above URL.
