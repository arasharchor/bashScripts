#!/bin/sh
# Script for installing Caffe support on Jetson TX1 Development Kitls
# 9-15-16 JetsonHacks.com
# MIT License
# Install and compile Caffe on NVIDIA Jetson TX1 Development Kit
# Prerequisites (which can be installed with JetPack 2):
# L4T 24.2 (Ubuntu 16.04)
# OpenCV4Tegra
# CUDA 8.0
# cuDNN v5.1
DEPEND=false
MAKE=true
TEST=false
INSTALL=false
CONFIG=false


if $DEPEND;
then
# Tested with last Github Caffe commit: 80f44100e19fd371ff55beb3ec2ad5919fb6ac43
sudo add-apt-repository universe
sudo apt-get update -y
/bin/echo -e "\e[1;32mLoading Caffe Dependencies.\e[0m"
sudo apt-get install cmake -y
# General Dependencies
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev \
libhdf5-serial-dev protobuf-compiler -y
sudo apt-get install --no-install-recommends libboost-all-dev -y
# BLAS
sudo apt-get install libatlas-base-dev -y
# Remaining Dependencies
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev -y
sudo apt-get install python-dev python-numpy -y

sudo usermod -a -G video $USER

fi

if $INSTALL;
then
/bin/echo -e "\e[1;32mCloning Caffe into the home directory\e[0m"
# Place caffe in the home directory
cd $HOME
# Git clone Caffe
#git clone https://github.com/BVLC/caffe.git 
cd caffe 

if $CONFIG;
then
#cp Makefile.config.example Makefile.config
# Regen the makefile; On 16.04, aarch64 has issues with a static cuda runtime
# add following line to CMakeList.txt
#set(OpenCV_DIR /home/nvidia/softwares/compiledOpenCV/3.3.0/share/OpenCV)

cmake -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF
fi
# Include the hdf5 directory for the includes; 16.04 has issues for some reason
#echo "INCLUDE_DIRS += /usr/include/hdf5/serial/" >> Makefile.config
#INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial /home/nvidia/softwares/cudnn/8.0-6.0/include /home/nvidia/softwares/nccl/build/include
#LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /home/nvidia/softwares/cudnn/8.0-6.0/lib64
#PYTHON_INCLUDE := /home/nvidia/.virtualenvs/facerec-cv3.3-np1.13.1-py2.7/include \
#		/home/nvidia/.virtualenvs/facerec-cv3.3-np1.13.1-py2.7/lib/python2.7/site-packages/numpy/core/include
#PYTHON_LIB := /home/nvidia/.virtualenvs/facerec-cv3.3-np1.13.1-py2.7/lib
#CUDA_DIR := /usr/local/cuda-8.0
#OPENCV_VERSION := 3
#USE_CUDNN := 1
#CUDA_ARCH := -gencode arch=compute_53,code=sm_53 \
#USE_NCCL := 1
#WITH_PYTHON_LAYER := 1
fi

if $MAKE;
then
cd $HOME
cd caffe
/bin/echo -e "\e[1;32mCompiling Caffe\e[0m"
make -j4 all
make -j4 pycaffe
# Run the tests to make sure everything works
fi

if $TEST;
then
/bin/echo -e "\e[1;32mRunning Caffe Tests\e[0m"
make -j test
make -j4 runtest
# The following is a quick timing test ...
# tools/caffe time --model=models/bvlc_alexnet/deploy.prototxt --gpu=0
fi
