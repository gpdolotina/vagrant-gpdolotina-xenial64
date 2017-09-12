read -d '' CONFIG <<EOF
[xdebug]
xdebug.profiler_append = 0
xdebug.profiler_enable = 0
xdebug.profiler_enable_trigger = 0
; priority=999
EOF

sudo echo -e "${CONFIG}" > /etc/php/7.0/cli/conf.d/999-localhost-xdebug.ini
#sudo phpenmod localhost