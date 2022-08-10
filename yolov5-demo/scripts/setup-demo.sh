#!/bin/bash

cd $PACKAGE_DIR

readonly repo=$DEMO_NAME

git clone https://github.com/ultralytics/$repo.git
cd $repo

git checkout 574ceedf -b 574ceedf

# Apply patches
for i in $(find $TMP_DIR -name "*.patch" | sort -n)
do
	echo "Applying patch $i"
	patch -p1 < $i
done

pip uninstall -y opencv-contrib-python-headless
pip install -U pip setuptools
pip install --no-cache-dir -r requirements.txt
pip install --no-cache-dir pafy youtube_dl==2020.12.2 "gradio<3.1"

# Generate weights
$TMP_DIR/convert-to-torchscript.sh
