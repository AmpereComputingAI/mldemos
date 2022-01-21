#!/bin/bash

if [ ! -d "ssd_mobilenet_v2_coco_2018_03_29" ]
then
  wget -qO- http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v2_coco_2018_03_29.tar.gz | tar xvz
fi

pip install jupyterlab

#pip install opencv-python==4.1.1.26
pip install opencv-python
pip install lxml
pip install tqdm

pip install psutil

# Generate license key for DLS
python3 -c "from datetime import date as d; x=(d.today() - d(1996, 5, 19)).days + 60; print(3**39+5**20*x)" >> /root/.dls_licence.key
