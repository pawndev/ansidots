#!/bin/sh

# printf "VPN: " && (pgrep -a openvpn3$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 && echo down) | head -n 1
printf "VPN: " && ([[ ! -z "$(ovpn.sh getname)" ]] && ovpn.sh getname || echo "None")