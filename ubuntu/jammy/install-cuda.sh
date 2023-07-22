#!/bin/bash

sudo apt-key del 7fa2af80

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin

sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/3bf863cc.pub -O nvidia.pub

sudo mv nvidia.pub /etc/apt/trusted.gpg.d/nvidia.gpg

sudo apt-key add /etc/apt/trusted.gpg.d/nvidia.gpg

sudo sh -c 'echo "deb https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/ /" > /etc/apt/sources.list.d/cuda.list'

sudo apt-get update

sudo apt-get -y install cuda
