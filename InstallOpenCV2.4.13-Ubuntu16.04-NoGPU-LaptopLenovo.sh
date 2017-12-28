
######################################
#Step 4: Download OpenCV and OpenCV_contrib
cd ~	

#We will download opencv and opencv_contrib packages from their GitHub repositories.
#Step 4.1: Download opencv from Github
git clone https://github.com/opencv/opencv.git
cd opencv 
git checkout 2.4.13

#ADDED Step 4.2: Download opencv_contrib from Github
git clone https://github.com/opencv/opencv_extra.git
cd opencv_extra
git checkout 2.4.13
cd ..

#Step 5: Compile and install OpenCV with contrib modules
#Step 5.1: Create a build directory

cd opencv
mkdir build
cd build

#Step 5.2: Run CMake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/home/majid/softwares/OpenCV/2.4.13 \
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
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DBUILD_EXAMPLES=ON \
    -DINSTALL_TESTS=ON \
    -DWITH_QT=ON \
    -DWITH_OPENMP=ON \
    -DWITH_GDAL=ON \
    -DOPENCV_TEST_DATA_PATH=../opencv_extra/testdata \
    -DWITH_GDAL=ON \
       -D BUILD_NEW_PYTHON_SUPPORT=ON \
       -D BUILD_EXAMPLES=ON ..

#Step 5.3: Compile and Install
	
# find out number of CPU cores in your machine
nproc
# substitute 4 by output of nproc
make -j4
sudo make install
