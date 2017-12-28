sudo apt-get update
sudo apt-get upgrade
sudo apt-get git
git config --global user.name "smajida"
git config --global user.email "s.majid.azimi@gmail.com"
git init Mytest
cd Mytest
gedit README
git add README
gedit sample.c
git add smaple.c
git commit -m "some_message"
#Creating a repository on GitHub
git remote add origin https://github.com/smajida/Mytest.git
git push origin master
