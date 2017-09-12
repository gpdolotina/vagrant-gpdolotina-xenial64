#!/bin/bash


##############################
## START

echo -e "\n\n---------REPORT provisioner---------\n\n"

PHP=$(which php)
if [ ! -z "${PHP}" ]; then
    echo -e "\e[4mPHP version:\e[0m"
    sudo php --version
    echo -e "\n"
fi

MYSQL=$(which mysql)
if [ ! -z "${MYSQL}" ]; then
    echo -e "\e[4mMYSQL version:\e[0m"
    sudo mysql --version
    echo -e "\n"
fi

APACHE=$(which apache2ctl)
if [ ! -z "${APACHE}" ]; then
    echo -e "\e[4mAPACHE version:\e[0m"
    sudo apache2ctl -v
    echo -e "\n"
fi

PHPUNIT=$(which phpunit)
if [ ! -z "${PHPUNIT}" ]; then
    echo -e "\e[4mPHPUnit version:\e[0m"
    phpunit --version
    echo -e "\n"
fi

COMPOSER=$(which phpunit)
if [ ! -z "${COMPOSER}" ]; then
    echo -e "\e[4mCOMPOSER version:\e[0m"
    COMPOSER_DISABLE_XDEBUG_WARN=1 composer --version --quiet
    echo -e "\n"
fi

NPM=$(which npm)
if [ ! -z "${NPM}" ]; then
    echo -e "\e[4mNPM version:\e[0m"
    sudo npm --version
    echo -e "\n"
fi

NODE=$(which node)
if [ ! -z "${NODE}" ]; then
    echo -e "\e[4mNODEJS version:\e[0m"
    sudo node --version
    echo -e "\n"
fi

BOWER=$(which bower)
if [ ! -z "${BOWER}" ]; then
    echo -e "\e[4mBOWER version:\e[0m"
    sudo bower --version
    echo -e "\n"
fi

GULP=$(which gulp)
if [ ! -z "${GULP}" ]; then
    echo -e "\e[4mGULP version:\e[0m"
    sudo gulp --version
    echo -e "\n"
fi

GRUNT=$(which grunt)
if [ ! -z "${GRUNT}" ]; then
    echo -e "\e[4mGRUNT version:\e[0m"
    sudo grunt --version
    echo -e "\n"
fi

LESSC=$(which lessc)
if [ ! -z "${LESSC}" ]; then
    echo -e "\e[4mLESSC version:\e[0m"
    sudo lessc --version
    echo -e "\n"
fi

JSHINT=$(which jshint)
if [ ! -z "${JSHINT}" ]; then
    echo -e "\e[4mJSHINT version:\e[0m"
    sudo jshint --version
    echo -e "\n"
fi

BROWSERSYNC=$(which browser-sync)
if [ ! -z "${BROWSERSYNC}" ]; then
    echo -e "\e[4mBROWSERSYNC version:\e[0m"
    sudo browser-sync --version
    echo -e "\n"
fi

PM2=$(which pm2)
if [ ! -z "${PM2}" ]; then
    echo -e "\e[4mPM2 version:\e[0m"
    sudo pm2 --version
    echo -e "\n"
fi