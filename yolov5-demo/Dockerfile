FROM aio-pytorch-1.11.0:1.2.0

ARG PACKAGE_DIR=/workspace
ARG TMP_DIR=$PACKAGE_DIR/tmp
ARG DEMO_NAME=yolov5
ARG DEMO_DIR=$PACKAGE_DIR/$DEMO_NAME

RUN apt update -y \
    && apt install -y libgl-dev libglib2.0-0 libsm6 cargo ffmpeg
RUN pip uninstall -y opencv-contrib-python-headless

RUN mkdir $TMP_DIR
COPY scripts/*.sh $TMP_DIR/
COPY patches/*.patch $TMP_DIR/
RUN $TMP_DIR/setup-demo.sh
RUN mkdir $DEMO_DIR/examples
COPY examples/ $DEMO_DIR/examples/
COPY app.py $DEMO_DIR/

WORKDIR $DEMO_DIR
