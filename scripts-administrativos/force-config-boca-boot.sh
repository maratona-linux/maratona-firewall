#!/bin/bash

if ! whoami |grep -q root; then
  echo "$0 must be run  as root"
  exit 0
fi


if [[ "$1" == "enable" ]]; then
  #disable lightdm
  systemctl mask lightdm.service
  if ! grep -q "$0" /etc/rc.local; then
  sed -i '/^exit 0/i \
bash $0 now' /etc/rc.local
fi

elif [[ "$1" == "disable" ]]; then
  #enable lightdm
  systemctl unmask lightdm.service
  sed -i '/bash $0 now/d' /etc/rc.local
elif [[ "$1" == "now" ]]; then
  dpkg-reconfigure maratona-firewall
  $0 disable
  reboot
else
  echo "Usage: $0 enable|disable|now"
fi

exit 0
