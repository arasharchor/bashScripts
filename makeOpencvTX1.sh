#!/bin/bash
# License: MIT. See license file in root directory
# Copyright(c) JetsonHacks (2017)
sudo apt-get update
sudo apt-get upgrade 

sudo apt-get install build-essential pkg-config

sudo apt-get install libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install qt5-default qttools5-dev-tools
sudo apt-get install libgtk2.0-dev
sudo apt-get install libatlas-base-dev gfortran
sudo apt-get install python2.7-dev python3-dev

sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip
echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.profile


sudo pip install numpy;sudo pip3 install numpy

cd $HOME
sudo apt-get install -y \
    libglew-dev \
    libtiff5-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpng12-dev \
    libjasper-dev \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libpostproc-dev \
    libswscale-dev \
    libeigen3-dev \
    libtbb-dev \
    libgtk2.0-dev \
    cmake \
    pkg-config

# Python 2.7
sudo apt-get install -y python-dev python-numpy python-py python-pytest -y


cd /media/nvidia/Transcend/tmp
cd opencv
#git clone https://github.com/opencv/opencv.git
git checkout -b v3.3.0 3.3.0
# This is for the test data

#cd $HOME/softwares
#git clone https://github.com/opencv/opencv_extra.git
#cd opencv_extra
#git checkout -b v3.3.0 3.3.0

#cd $HOME/softwares
#cd opencv
mkdir build
cd build
# Jetson TX1 

####4

cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/home/nvidia/softwares/compiledOpenCV/3.3.0 \
    -DBUILD_PNG=ON \
    -DBUILD_TIFF=ON \
    -DBUILD_TBB=ON \
    -DBUILD_JPEG=ON \
    -DBUILD_JASPER=ON \
    -DBUILD_ZLIB=ON \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_opencv_java=OFF \
    -DBUILD_opencv_python2=ON \
    -DBUILD_opencv_python3=ON \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=ON \
    -DWITH_CUDA=ON \
    -DWITH_GTK=ON \
    -DWITH_VTK=ON \
    -DWITH_TBB=ON \
    -DWITH_1394=ON \
    -DWITH_OPENEXR=ON \
    -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-8.0 \
    -DCUDA_ARCH_BIN=5.3 \
    -DCUDA_ARCH_PTX="" \
    -DENABLE_NEON=ON \
    -DWITH_LIBV4L=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_CPP_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_opencv_dnn=ON \
    -DINSTALL_TESTS=ON \
    -DWITH_QT=ON \
    -DWITH_OPENCL=ON \
    -DBUILD_TESTS=ON \
    -DBUILD_PERF_TESTS=ON \
    -DENABLE_CXX11=ON \
    -DWITH_CUBLAS=ON \
    -DWITH_XINE=ON \
    -DWITH_OPENMP=ON \
    -DWITH_TBB=ON \
    -DOPENCV_EXTRA_MODULES_PATH=/home/nvidia/softwares/opencv/opencv_contrib/modules \
    -DWITH_GSTREAMER_0_10=ON \
    -DWITH_GDAL=ON \
    -DOPENCV_TEST_DATA_PATH=/home/nvidia/softwares/opencv/opencv_extra/testdata ..

make -j4 VERBOSE=1;make install -j4;echo "finished"




echo "export PKG_CONFIG_PATH=/home/nvidia/softwares/compiledOpenCV/3.3.0/lib/pkgconfig:$PKG_CONFIG_PATH" >> ~/.bashrc

git clone https://github.com/NVIDIA/nccl.git
cd nccl
make CUDA_HOME=/usr/local/cuda-8.0 test
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/nvidia/softwares/nccl/build/lib" >> ~/.bashrc

echo "export LD_LIBRARY_PATH=/home/nvidia/softwares/compiledOpenCV/3.3.0/lib:$LD_LIBRARY_PATH=" >> ~/.bashrc

sudo cp dlib.so /usr/local/lib/python2.7/dist-packages
for NAME in dpnn nn optim optnet csvigo cutorch cunn fblualib torchx tds; do luarocks install $NAME; done
sudo python2 setup.py install
Run models/get-models.sh

cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/home/nvidia/softwares/compiledOpenCV/3.3.0 \
    -DBUILD_PNG=ON \
    -DBUILD_TIFF=OFF \
    -DBUILD_TBB=OFF \
    -DBUILD_JPEG=ON \
    -DBUILD_JASPER=OFF \
    -DBUILD_ZLIB=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_opencv_java=OFF \
    -DBUILD_opencv_python2=ON \
    -DBUILD_opencv_python3=OFF \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=OFF \
    -DWITH_CUDA=ON \
    -DWITH_QT=ON \
    -DWITH_GTK=ON \
    -DWITH_VTK=ON \
    -DWITH_1394=OFF \
    -DWITH_OPENEXR=OFF \
    -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-8.0 \
    -DCUDA_ARCH_BIN=5.3 \
    -DCUDA_ARCH_PTX="" \
    -DWITH_LIBV4L=ON \
    -DINSTALL_C_EXAMPLES=OFF \
    -DINSTALL_CPP_EXAMPLES=OFF \
    -DINSTALL_PYTHON_EXAMPLES=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DWITH_OPENCL=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DWITH_CUBLAS=ON \
    -DWITH_XINE=OFF ..

