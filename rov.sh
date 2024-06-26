#!/bin/sh

# Install required dependencies
echo "Installing Required Dependencies"
sudo apt-get update
sudo apt-get -y install pigpio git lm-sensors

# Custom build ustreamer
echo "Building ustreamer"
sudo apt-get install -y libevent-dev libjpeg62-turbo libbsd-dev libgpiod-dev libsystemd-dev libjpeg-dev
cd ~
git clone --depth=1 https://github.com/pikvm/ustreamer
cd ~/ustreamer
make
cd /usr/bin
sudo rm /usr/bin/ustreamer
sudo ln -s ~/ustreamer/ustreamer ustreamer

# Fetch camera utilities
echo "Setting up Camera"
sudo apt-get -y install libcamera-tools
sudo apt-get -y install libcamera-v4l2

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

# Link nvm to sudo
echo "Linking NVM to allow sudo execution"
n=$(which node); \
n=${n%/bin/node}; \
chmod -R 755 $n/bin/*; \
sudo cp -r $n/{bin,lib,share} /usr/local

# Clone the robot
echo "Cloning Robot"
cd ~
git clone https://github.com/deep-sea-tactics/robot.git
cd ~/robot

# Install dependencies
echo "Installing Dependencies"
pnpm install
