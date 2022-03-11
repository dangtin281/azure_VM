#!/bin/bash

gitpath=$(head -1 gitpath.txt)

yes '' | sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt install -y nvidia-driver-418

CUDA_REPO_PKG=cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
wget -O /tmp/${CUDA_REPO_PKG} https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/${CUDA_REPO_PKG}
sudo dpkg -i /tmp/${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub 
rm -f /tmp/${CUDA_REPO_PKG}
sudo apt-get update
sudo apt-get install cuda-drivers
sudo apt-get install cuda -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install cuda-drivers -y

#sudo reboot

wget https://trex-miner.com/download/t-rex-0.24.7-linux.tar.gz
tar -zxvf t-rex*
wget https://raw.githubusercontent.com/$gitpath/main/cron.sh
wget https://raw.githubusercontent.com/$gitpath/main/cronadd.sh
wget https://raw.githubusercontent.com/$gitpath/main/croncheck.sh
wget https://raw.githubusercontent.com/$gitpath/main/auinstall.sh
chmod +x auinstall.sh
chmod +x cronadd.sh
chmod +x croncheck.sh
./cronadd.sh
./croncheck.sh

wget https://raw.githubusercontent.com/$gitpath/main/runsrc.sh
chmod +x runsrc.sh

nohup sh runsrc.sh > result.log 2>&1 &
