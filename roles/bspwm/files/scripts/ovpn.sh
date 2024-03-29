#!/bin/bash

  # CONFIG_NAME="etf1_aws.ovpn"
  # VPN_PATH="$HOME/.vpn"
  CONFIG_NAME="efebe5d6xbf04x4cd0xb77ax1663ad1015e7"
  VPN_PATH="/net/openvpn/v3/configuration"
  CMD=$1

  function usage() {
    echo "USAGE: ovpn <command>"
    echo "Command available:"
    echo ""
    echo "login"
    echo "stat"
    echo "logout"
    echo "toggle"
    echo "getname"
    exit 1
  }

  function ovpnlogin() {
    openvpn3 session-start --config-path "$VPN_PATH/$CONFIG_NAME"
    echo -n "All done!"
  }

  function ovpnstat() {
    tmux rename-window vpn
    watch -n30 openvpn3 session-stats --path "$VPN_PATH/$CONFIG_NAME"
  }

  function ovpnlogout() {
    openvpn3 session-manage --path "$VPN_PATH/$CONFIG_NAME" -D
    echo -n "All done!"
  }

  function ovpnrestart() {
    openvpn3 session-manage --path "$VPN_PATH/$CONFIG_NAME" --restart
    echo -n "All done!"
  }

  function ovpngetname() {
    substr=$(openvpn3 sessions-list | grep "Config name" | cut -d'.' -f2 | cut -d'/' -f2)
    trimedStr=$(echo "${substr##*( )}")
    echo $trimedStr
  }

  function ovpntoggle() {
    substr=$(openvpn3 sessions-list | grep "Config name" | cut -d'.' -f2 | cut -d'/' -f2)
    trimedStr=$(echo "${substr##*( )}")
    if [ -z "$trimedStr" ]; then
      ovpnlogin
    else
      ovpnlogout
    fi
  }

  function parseArgs() {
    case "$CMD" in
      "login") ovpnlogin;;
      "stat") ovpnstat;;
      "logout") ovpnlogout;;
      "toggle") ovpntoggle;;
      "restart") ovpnrestart;;
      "getname") ovpngetname;;
      *)
        echo -n "unknown"
        ;;
    esac
  }

  # trap ctrl-c and call ctrl_c()
  trap ctrl_c INT

  function ctrl_c() {
    tmux rename-window zsh
  }

  [ -z "$CMD" ] && usage || parseArgs
