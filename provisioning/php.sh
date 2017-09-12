#!/bin/bash


# tell debconf to use a frontend that expects no interactive input at all
export DEBIAN_FRONTEND=noninteractive


##############################
## START

echo -e "\n\n---------PHP provisioner---------\n\n"


####################
## PHP 7

echo -e "\n\n---------Installing PHP 7---------\n\n"

# install PHP 7.0 and modules
sudo apt-get install -y php
sudo apt-get install -y libapache2-mod-php php-mcrypt php-mysql
sudo apt-get install -y php-apcu php-cli php-common php-curl php-gd php-gmp php-imagick php-intl php-file-iterator php-geoip
sudo apt-get install -y php-mbstring php-memcache php-memcached php-pear php-xdebug
sudo apt-get install -y php-imap php-json php-soap php-streams php-xml php-log php-mail php-mime-type php-phpseclib php-zip
sudo apt-get install -y php-auth php-auth-http php-xml-parser php-xml-rpc2 php-zip
sudo apt-get install -y php-console-commandline php-dompdf php-fpdf
sudo apt-get install -y libphp-phpmailer libphp-predis libphp-swiftmailer

# enable PHP modules
sudo phpenmod curl dom exif fileinfo ftp gettext imap json mbstring mcrypt opcache pdo phar readline simplexml soap sockets tokenizer wddx xml xmlreader xmlwriter xsl zip




echo -e "\n\n---------Configure PHP---------\n\n"

read -d '' CONFIG <<EOF
[php]
error_reporting = E_ALL
display_errors = On
error_log = /var/logs/php_errors.log
opcache.error_log = /var/logs/opcache_errors.log

[xdebug]
xdebug.auto_trace=1
xdebug.cli_color=1
xdebug.collect_assignments=1
xdebug.collect_includes=1
xdebug.default_enable=1
xdebug.dump_globals=1
xdebug.extended_info=1
xdebug.profiler_enable=1
xdebug.profiler_append=1
xdebug.show_exception_trace=0
xdebug.overload_var_dump=2

; priority=999
EOF
sudo echo -e "${CONFIG}" > /etc/php/7.0/mods-available/localhost.ini
sudo phpenmod localhost


# modify apache config DirectoryIndex
if [ -f "/etc/apache2/mods-available/dir.conf" ]; then
    sudo sh -c "sed -i 's/DirectoryIndex\(.*\)/DirectoryIndex index.php index.phtml \1 /g' /etc/apache2/mods-available/dir.conf"
fi





echo -e "\n\n---------Restarting PHP---------\n\n"

# restart apache server
sudo apache2ctl configtest && sudo apache2ctl restart

# update all
sudo apt-get -y update --fix-missing && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove

echo -e "\e[4mPHP version:\e[0m"
sudo php --version

echo -e "\e[4mPHP modules:\e[0m"
sudo php -m
