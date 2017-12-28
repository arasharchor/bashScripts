/bin/echo -e "\e[1;32mCloning Torch.\e[0m"
git clone https://github.com/torch/distro.git $HOME/softwares/Torch --recursive
#mkdir $HOME/softwares/Torch
cd $HOME/softwares/Torch
/bin/echo -e "\e[1;32mInstalling Torch Dependencies.\e[0m"
bash install-deps
/bin/echo -e "\e[1;32mCompiling Torch.\e[0m"
./install.sh

/bin/echo -e "\e[1;32mCompiling Torch libraries.\e[0m"
for NAME in dpnn nn optim optnet csvigo cutorch cunn fblualib torchx tds; do luarocks install $NAME; done


/bin/echo -e "\e[1;32mBuilding OpenFace.\e[0m"
cd $HOME/softwares/OpenFace
sudo python2 setup.py install
