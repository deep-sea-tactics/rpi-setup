#!/bin/sh

# Install required dependencies
sudo apt update
sudo apt -y install ustreamer pigpio git

# TODO: camera setup
sudo apt -y install libcamera-tools
sudo apt -y install libcamera-v4l2

# Setup NVM & reload terminal
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc

# Install and use latest node version
nvm install --lts
nvm use --lts

# Install pnpm
npm i -g pnpm

# Clone the robot
cd ~
git clone https://github.com/deep-sea-tactics/robot.git
cd ~/robot

# Install dependencies
pnpm install
