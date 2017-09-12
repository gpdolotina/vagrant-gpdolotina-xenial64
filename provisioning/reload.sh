#!/bin/bash


echo -e "\n\n---------Configuring APACHE---------\n\n"

# change ServerName setting
CONF_FILE="/etc/apache2/conf-available/localhost.conf"

# setup apache2 vhosts
if [ -d "/var/vhosts" ]; then
    # get the apache version
    APACHE_VERSION=$(sudo apache2ctl -v | grep -Po "(?<=Server version: Apache/).+?(?=\(.*\))")


    function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }
    if [ $(version $APACHE_VERSION) -ge $(version "2.4") ]; then
        sudo sh -c "echo 'IncludeOptional /var/vhosts/*.conf' >> ${CONF_FILE}"
    else
        sudo sh -c "echo 'Include /var/vhosts/*.conf' >> ${CONF_FILE}"
    fi
fi


# enable config file
sudo a2enconf localhost

# restart apache server
sudo apache2ctl configtest && sudo apache2ctl restart
