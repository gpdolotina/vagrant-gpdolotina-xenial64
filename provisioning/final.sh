#!/bin/bash


##############################
## START

echo -e "\n\n---------FINAL provisioner---------\n\n"


# update all
sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove
