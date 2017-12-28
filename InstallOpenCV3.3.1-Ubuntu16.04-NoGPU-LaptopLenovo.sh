#Install OpenCV3 on Ubuntu
#source; https://www.learnopencv.com/install-opencv3-on-ubuntu/
#credit:June 6, 2017 By Vaibhaw Singh Chandel

#Ubuntu 16.04: How to install OpenCV
#source:https://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/
#By Adrian Rosebrock on October 24, 2016 in OpenCV 3, Tutorials 


# modified for openCV 3.3.1 on Ubuntu 16.04
#In this post, we will provide step by step instructions for installing OpenCV 3 (C++ and Python) on Ubuntu.
#Step 1: Update packages
	
sudo apt-get update
sudo apt-get upgrade

#Step 2: Install OS libraries

#Remove any previous installations of x264</h3>
sudo apt-get remove x264 libx264-dev
 
#We will Install dependencies now


sudo apt-get install build-essential checkinstall cmake pkg-config yasm
sudo apt-get install git gfortran
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev
 
# If you are using Ubuntu 14.04
#sudo apt-get install libtiff4-dev
# If you are using Ubuntu 16.04
sudo apt-get install libtiff5-dev

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install libxine2-dev libv4l-dev
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install libvorbis-dev libxvidcore-dev
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install x264 v4l-utils
##adrians
sudo apt-get install libx264-dev
sudo apt-get install libgtk-3-dev
#

#myself
#method1
sudo apt-get install ffmpeg
#method2
#sudo add-apt-repository ppa:jonathonf/ffmpeg-3
#sudo apt update
#sudo apt install ffmpeg libav-tools x264 x265
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
#sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get gdal-bin


# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

#Step 3: Install Python libraries	

#adrian
sudo apt-get install python2.7-dev python3.5-dev
cd ~
wget https://bootstrap.pypa.io/get-pip.py
sudo python2 get-pip.py
sudo python3 get-pip.py
#


#sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy

#We will use Virtual Environment to install Python libraries. It is generally a good practice in order to separate your project environment and global environment.
	
# Install virtual environment
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper
#adrian
sudo rm -rf ~/get-pip.py ~/.cache/pip
#

echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
#adrian
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
#
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc
  
############ For Python 2 ############
# create virtual environment
mkvirtualenv cv-py2 -p python2
workon cv-py2
  
# now install python libraries within this virtual environment
pip install numpy scipy matplotlib scikit-image scikit-learn ipython
  
# quit virtual environment
deactivate
######################################
  
############ For Python 3 ############
# create virtual environment
mkvirtualenv cv-py3 -p python3
workon cv-py3
  
# now install python libraries within this virtual environment
pip install numpy scipy matplotlib scikit-image scikit-learn ipython
  
# quit virtual environment
deactivate
######################################
#Step 4: Download OpenCV and OpenCV_contrib
cd ~	

#We will download opencv and opencv_contrib packages from their GitHub repositories.
#Step 4.1: Download opencv from Github
git clone https://github.com/opencv/opencv.git
cd opencv 
git checkout 3.3.1 
cd ..
#Step 4.2: Download opencv_contrib from Github
	
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.1
cd ..

#ADDED Step 4.3: Download opencv_contrib from Github
git clone https://github.com/opencv/opencv_extra.git
cd opencv_extra
git checkout 3.3.1
cd ..

#Step 5: Compile and install OpenCV with contrib modules
#Step 5.1: Create a build directory

cd opencv
mkdir build
cd build

#Step 5.2: Run CMake
	
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/home/majid/softwares/OpenCV/3.3.1 \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=ON \
    -DBUILD_PNG=ON \
    -DBUILD_TIFF=ON \
    -DBUILD_TBB=ON \
    -DBUILD_JPEG=ON \
    -DWITH_GTK=ON \
    -DENABLE_NEON=ON \
    -DWITH_LIBV4L=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_CPP_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DBUILD_EXAMPLES=ON \
    -DBUILD_opencv_dnn=ON \
    -DBUILD_opencv_python2=ON \
    -DBUILD_opencv_python3=ON \
    -DINSTALL_TESTS=ON \
    -DWITH_QT=ON \
    -DENABLE_CXX11=ON \
    -DWITH_OPENMP=ON \
    -DWITH_GDAL=ON \
    -DOPENCV_TEST_DATA_PATH=../../opencv_extra/testdata \
    -DWITH_GDAL=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..

#Step 5.3: Compile and Install
	
# find out number of CPU cores in your machine
nproc
# substitute 4 by output of nproc
make -j4
sudo make install
#sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
#sudo ldconfig

#Step 5.4: Create symlink in virtual environment

#Depending upon Python version you have, paths would be different. OpenCV’s Python binary (cv2.so) can be installed either in directory site-packages or dist-packages. Use the following command to find out the correct location on your machine.
	
#find /usr/local/lib/ -type f -name "cv2*.so"

#adrian
#ls -l /usr/local/lib/python2.7/site-packages/
#cd ~/.virtualenvs/cv/lib/python2.7/site-packages/
#ln -s /usr/local/lib/python2.7/site-packages/cv2.so cv2.so
#ls -l /usr/local/lib/python3.5/site-packages/
#cd /usr/local/lib/python3.5/site-packages/
#sudo mv cv2.cpython-35m-x86_64-linux-gnu.so cv2.so
#cd ~/.virtualenvs/cv/lib/python3.5/site-packages/
#ln -s /usr/local/lib/python3.5/site-packages/cv2.so cv2.so
#
#It should output paths similar to one of these (or two in case OpenCV was compiled for both Python2 and Python3):
	
############ For Python 2 ############
## binary installed in dist-packages
#/usr/local/lib/python2.6/dist-packages/cv2.so
#/usr/local/lib/python2.7/dist-packages/cv2.so
## binary installed in site-packages
#/usr/local/lib/python2.6/site-packages/cv2.so
#/usr/local/lib/python2.7/site-packages/cv2.so
  
############ For Python 3 ############
## binary installed in dist-packages
#/usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-x86_64-linux-gnu.so
#/usr/local/lib/python3.6/dist-packages/cv2.cpython-36m-x86_64-linux-gnu.so
## binary installed in site-packages
#/usr/local/lib/python3.5/site-packages/cv2.cpython-35m-x86_64-linux-gnu.so
#/usr/local/lib/python3.6/site-packages/cv2.cpython-36m-x86_64-linux-gnu.so

#Double check the exact path on your machine before running the following commands
	
############ For Python 2 ############
#cd ~/.virtualenvs/facecourse-py2/lib/python2.7/site-packages
#ln -s /usr/local/lib/python2.7/dist-packages/cv2.so cv2.so
  
############ For Python 3 ############
#cd ~/.virtualenvs/facecourse-py3/lib/python3.5/site-packages
#ln -s /usr/local/lib/python3.6/dist-packages/cv2.cpython-36m-x86_64-linux-gnu.so cv2.so

#Step 6: Test OpenCV3

#We will test a red eye remover application written in OpenCV to test our C++ and Python installations. Download RedEyeRemover.zip and extract it into a folder.

#Step 6.1: Test C++ code

#Move inside extracted folder, compile and run.
	
# compile
# There are backticks ( ` ) around pkg-config command not single quotes
#g++ -std=c++11 removeRedEyes.cpp `pkg-config --libs --cflags opencv` -o removeRedEyes
# run
#./removeRedEyes

#Step 6.2: Test Python code
#Activate Python virtual environment
	
############ For Python 2 ############
#workon cv-py2
 
############ For Python 3 ############
#workon cv-py3

#Quick Check
	
# open ipython (run this command on terminal)
#ipython
# import cv2 and print version (run following commands in ipython)
#import cv2
#print cv2.__version__
# If OpenCV3 is installed correctly,
# above command should give output 3.3.1
# Press CTRL+D to exit ipython

cd ~
#rm -rf opencv opencv_contrib opencv_extra opencv.zip opencv_contrib.zip opencv_extra.zip

#Run RedEyeRemover demo
	
python removeRedEyes.py

#Now you can exit from Python virtual environment.
	
deactivate

#Whenever you are going to run Python scripts which use OpenCV you should activate the virtual environment we created, using workon command.
