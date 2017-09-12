#!/bin/bash


echo -e "\n\n---------NODEJS provisioner---------\n\n"



echo -e "\n\n---------Installing NODEJS---------\n\n"

# add the nodejs ppa to install the latest nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install nodejs
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential