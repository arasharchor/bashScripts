
#Install using the repository
sudo apt-get update 

#Install packages to allow apt to use a repository over HTTP
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


#Install Docker CE
sudo apt-get update
#Install the latest version of Docker CE, or go to the next step to install a specific version. Any existing installation of Docker is replaced.

sudo apt-get install docker-ce

#On production systems, you should install a specific version of Docker CE instead of always using the latest. This output is truncated. List the available versions.

#apt-cache madison docker-ce

#sudo apt-get install docker-ce #=<VERSION>

#The Docker daemon starts automatically.

#Verify that Docker CE is installed correctly by running the hello-world image.

sudo docker run hello-world

#This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

#Upgrade Docker CE

#To upgrade Docker CE, first run sudo apt-get update, then follow the installation instructions, choosing the new version you want to install.

#sudo apt-get install docker-compose

#for deep video analysis
#sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#sudo usermod -aG docker $USER
#or
#sudo groups $USER
#git clone https://github.com/AKSHAYUBHAT/DeepVideoAnalytics
#cd DeepVideoAnalytics/docs/tutorial && docker-compose up
############################
#


