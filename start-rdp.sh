#!/bin/bash
RDP_PORT=$SERVER_PORT
sed -i "s/^port=3389/port=$RDP_PORT/" /etc/xrdp/xrdp.ini
service xrdp restart
tail -f /var/log/xrdp.log
