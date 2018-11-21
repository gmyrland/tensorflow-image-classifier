FROM tensorflow/tensorflow:1.1.0

MAINTAINER Glen Myrland "glenmyrland@gmail.com"

WORKDIR /

COPY src/retrain.py /
COPY src/label_image.py /
