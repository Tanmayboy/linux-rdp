#!/bin/bash
apt update && apt install -y xrdp xfce4 xfce4-terminal dbus-x11 x11-xserver-utils

# Add user for RDP
useradd -m -s /bin/bash $RDP_USER
echo "$RDP_USER:$RDP_PASS" | chpasswd

# Allow xRDP to use our session
echo xfce4-session > /home/$RDP_USER/.xsession
chown $RDP_USER:$RDP_USER /home/$RDP_USER/.xsession

# Enable xRDP service
systemctl enable xrdp
