git clone https://github.com/pjreddie/darknet
cd darknet
modify makefile for gpu and opencv and cudnn
make
wget --no-check-certificate https://pjreddie.com/media/files/yolo.weights
./darknet detect cfg/yolo.cfg yolo.weights data/dog.jpg
./darknet detector test cfg/coco.data cfg/yolo.cfg yolo.weights data/dog.jpg
./darknet detect cfg/yolo.cfg yolo.weights data/dog.jpg -thresh 0
wget --no-check-certificate https://pjreddie.com/media/files/tiny-yolo-voc.weights
./darknet detector test cfg/voc.data cfg/tiny-yolo-voc.cfg tiny-yolo-voc.weights data/dog.jpg

./darknet detector demo cfg/coco.data cfg/yolo.cfg yolo.weights


./darknet detector demo cfg/coco.data cfg/yolo.cfg yolo.weights <video file>


curl -O https://pjreddie.com/media/files/VOCtrainval_11-May-2012.tar
curl -O https://pjreddie.com/media/files/VOCtrainval_06-Nov-2007.tar
curl -O https://pjreddie.com/media/files/VOCtest_06-Nov-2007.tar
tar xf VOCtrainval_11-May-2012.tar
tar xf VOCtrainval_06-Nov-2007.tar
tar xf VOCtest_06-Nov-2007.tar

curl -O https://pjreddie.com/media/files/voc_label.py
python voc_label.py

ls
2007_test.txt   VOCdevkit
2007_train.txt  voc_label.py
2007_val.txt    VOCtest_06-Nov-2007.tar
2012_train.txt  VOCtrainval_06-Nov-2007.tar
2012_val.txt    VOCtrainval_11-May-2012.tar

cat 2007_train.txt 2007_val.txt 2012_*.txt > train.txt


 1 classes= 20
  2 train  = <path-to-voc>/train.txt
  3 valid  = <path-to-voc>2007_test.txt
  4 names = data/voc.names
  5 backup = backup


curl -O https://pjreddie.com/media/files/darknet19_448.conv.23



./darknet partial cfg/darknet19_448.cfg darknet19_448.weights darknet19_448.conv.23 23


./darknet detector train cfg/voc.data cfg/yolo-voc.cfg darknet19_448.conv.23

