#!/bin/bash



echo -e "\n\n---------Fixing NODEJS permissions issues---------\n\n"


# check npm permissions
NPM_PREFIX=$(npm config get prefix)
if [ "${NPM_PREFIX}" == "/usr" ]; then
    # fix the EACCESS permissions issue

    NPM_PREFIX_NEW='/vagrant/.npm-global'
    sudo mkdir -pv "${NPM_PREFIX_NEW}"

    # configure npm to use the new directory path
    sudo npm config set prefix "${NPM_PREFIX_NEW}"

    # change env PATH
    sudo sh -c "sed -i 's/PATH\=\"\(.*\)\"/PATH\=\"\/vagrant\/.npm-global\/bin:\1\"/g' /etc/environment"
fi