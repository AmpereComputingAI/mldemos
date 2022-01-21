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
pip install youtube-dl
#pip install pafy
pip install git+https://github.com/Cupcakus/pafy

yum -y install epel-release
yum -y localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
rm SDL2-2.0.10-2.el8.aarch64.rpm || true
wget http://mirror.leaseweb.com/centos/8/PowerTools/aarch64/os/Packages/SDL2-2.0.10-2.el8.aarch64.rpm
yum -y install SDL2-2.0.10-2.el8.aarch64.rpm
yum -y install ffmpeg-libs
yum -y install ffmpeg
yum -y install numactl

# Generate license key for DLS
python3 -c "from datetime import date as d; x=(d.today() - d(1996, 5, 19)).days + 60; print(3**39+5**20*x)" >> /root/.dls_licence.key
