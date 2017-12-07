# Machine Learning Engineer Capstone

This work aims to provide a robust algorithm to classify the fundamental type given a fingerprint image, based on Convolutional Neural Networks, as described in the [proposal](capstone_proposal_template.md). It worth notice that for the development it is used a docker container with Keras, Tensorflow and NVidia GPU support, so we get both high performance and repeatability. To use the same environment of this work, you shall use the following commands:

```
docker pull datmo/keras-tensorflow
cd <PATH_TO_PROJECT>
nvidia-docker run --name capstone -p 8888:8888 -v(pwd):/workspace -ti datmo/keras-tensorflow:gpu
```

## Dataset

The database is fully available on [NIST](https://www.nist.gov/srd/nist-special-database-4). Follow the website's instructions to download the entire dataset. Then, move the important assets to this project:

```bash
unzip <DownloadPath>/NISTSpecialDatabase4GrayScaleImagesofFIGS.zip
mv <DownloadPath>/NISTSpecialDatabase4GrayScaleImagesofFIGS/sd04/png_txt/* <ProjectPath>/data/
```

To simplify, I wrote a simple bash script [dataset parser](./parse.sh) that iterates over each pair of image & text, to generate a single CSV file in the form `<image_path>, <class_symbol>`:

```
path,target
./data/figs_3/f0779_10.png,L
./data/figs_3/s0753_03.png,R
./data/figs_3/f0844_03.png,T
./data/figs_3/s0932_01.png,A
./data/figs_3/f0769_04.png,R
./data/figs_3/f0793_09.png,L
./data/figs_3/f0847_01.png,W
./data/figs_3/s0818_02.png,L
./data/figs_3/f0790_01.png,R
```

## Convolutional Neural Network

The proposed network is presented using the _summary_ method of Keras package.

```
Layer (type)                 Output Shape              Param #   
=================================================================
conv2d_4 (Conv2D)            (None, 512, 512, 16)      160       
_________________________________________________________________
max_pooling2d_4 (MaxPooling2 (None, 256, 256, 16)      0         
_________________________________________________________________
conv2d_5 (Conv2D)            (None, 256, 256, 32)      4640      
_________________________________________________________________
max_pooling2d_5 (MaxPooling2 (None, 128, 128, 32)      0         
_________________________________________________________________
conv2d_6 (Conv2D)            (None, 128, 128, 64)      18496     
_________________________________________________________________
max_pooling2d_6 (MaxPooling2 (None, 64, 64, 64)        0         
_________________________________________________________________
global_average_pooling2d_2 ( (None, 64)                0         
_________________________________________________________________
dense_3 (Dense)              (None, 100)               6500      
_________________________________________________________________
dropout_2 (Dropout)          (None, 100)               0         
_________________________________________________________________
dense_4 (Dense)              (None, 5)                 505       
=================================================================
Total params: 30,301
Trainable params: 30,301
Non-trainable params: 0
_________________________________________________________________
```
