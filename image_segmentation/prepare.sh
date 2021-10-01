#!/bin/bash
apt-get update
apt-get install -y curl
pip install "pillow!=8.3.0"
pip install h5py==2.10.0
pip install ipywidgets

echo 'Downloading images and annotations'
curl -O https://www.robots.ox.ac.uk/~vgg/data/pets/data/images.tar.gz
curl -O https://www.robots.ox.ac.uk/~vgg/data/pets/data/annotations.tar.gz
tar -xf images.tar.gz
tar -xf annotations.tar.gz

# Generate license key for DLS
python3 -c "from datetime import date as d; x=(d.today() - d(1996, 5, 19)).days + 60; print(3**39+5**20*x)" >> /root/.dls_licence.key
