#!/bin/sh

# Install required dependencies
echo "Installing Required Dependencies"
sudo apt update
sudo apt -y install pigpio git

# Custom build ustreamer
echo "Building Ustreamer"
sudo apt install -y libevent-dev libjpeg62-turbo libbsd-dev libgpiod-dev libsystemd-dev libjpeg-dev
cd ~
git clone --depth=1 https://github.com/pikvm/ustreamer
cd ~/ustreamer
make
cd /usr/bin
sudo rm /usr/bin/ustreamer
sudo ln -s ~/ustreamer/ustreamer ustreamer

# TODO: camera setup
echo "Setting up Camera"
sudo apt -y install libcamera-tools
sudo apt -y install libcamera-v4l2
sudo modprobe bcm2835-v4l2

# Setup NVM & reload terminal
echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc

# Install and use latest node version
echo "Installing LTS Node"
nvm install --lts
nvm use --lts

# Install pnpm
echo "Installing PNPM"
npm i -g pnpm@9.1.1

# Clone the robot
echo "Cloning Robot"
cd ~
git clone https://github.com/deep-sea-tactics/robot.git
cd ~/robot

# Install dependencies
echo "Installing Dependencies"
pnpm install
