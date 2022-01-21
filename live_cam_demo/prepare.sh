#!/bin/bash

if [ ! -d "ssd_mobilenet_v2_coco_2018_03_29" ]
then
  wget -qO- http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v2_coco_2018_03_29.tar.gz | tar xvz
fi

pip install jupyterlab

export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libGLdispatch.so.0.0.0

pip install opencv-python==4.1.1.26
pip install lxml
pip install tqdm

pip install psutil
pip install youtube-dl

#pip install pafy
pip install git+https://github.com/Cupcakus/pafy

apt-get install ffmpeg

# Generate license key for DLS
python3 -c "from datetime import date as d; x=(d.today() - d(1996, 5, 19)).days + 60; print(3**39+5**20*x)" >> /root/.dls_licence.key
