# mldemos
Scripts used for various types of external demos. 

## yolov3_tf2 (Latency demo)
This is to demonstrate the latency of performing object detection with YoloV3. Jupyter Notebook is used to run the demo.
Steps of running the demo.
1. cd yolov3_tf2
2. Install packages and prepare model files. Only need to run it once. "./prepare.sh"
3. Launch Jupyter. "./start_jupyter_altra.sh".  (If you launch it on AWS x86 instance, please use ./start_jupyter_x86.sh)
4. Open the browser to go to the URL returned by Jupyter. Note that you will need to configure the port forwarding accordingly.
5. Click to run the ipynb Notebook file "detect_video_altra.ipynb". (On AWS x86 instance, run "detect_video_x86.ipynb" instead)
6. Click "Run" button. You should see a video playing with overlay of bounding box and classification of objects. The latency, averaged over a sliding window of frames, is also printed on the display.

## image_segmentation (Throughput demo)
This is the demonstrate the throughput of performing image segmentation.
Steps of running the demo
1. cd image_segmentation
2. Install packages and prepare model/data files. Only need to run it once. "./prepare.sh"
3. Launch Jupyter. "./start_jupyter_altra.sh". (If you launch it on AWS x86 instance for comparison, please use ./start_jupyter_x86.sh)
4. Open the browser to go to the URL returned by Jupyter. Note tha tyou will need to configure the port forwarding accordingly.
5. Click to run the ipynb Notebook file "oxford_pets_image_segmentation_altra.ipynb" (On AWS x86 instance, run "oxford_pets_image_segmentation_x86.ipynb"
6. In the notebook, the data download cell only needs to run once.
7. Run the rest of the notebook cells. At the end of the run, it will show the FPS (frames per second) of image segmentation batch processing. It will also show the result of first 10 images.
