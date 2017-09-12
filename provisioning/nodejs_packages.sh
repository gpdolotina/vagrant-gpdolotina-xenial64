#!/bin/bash



echo -e "\n\n---------Installing and Updating NODEJS modules---------\n\n"

# install gulp
sudo npm install --global gulp gulp-cli

# install grunt
sudo npm install --global grunt-cli

# install bower
sudo npm install --global bower

# install browserify
sudo npm install --global browserify

# install yeoman
sudo npm install --global yo generator-webapp

# install LESS and SASS
sudo npm install --global less

# install jshint
sudo npm install --global jshint

# install browser-sync
sudo npm install --global browser-sync

# install process manager
sudo npm install --global pm2

# update all modules
sudo npm update --global

# update all
sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove