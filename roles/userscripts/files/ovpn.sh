#!/bin/bash

  CONFIG_NAME="etf1_aws.ovpn"
  VPN_PATH="$HOME/.vpn"
  CMD=$1

  function parseBaseOptions() {}

  function usage() {
    echo "USAGE: ovpn <command>"
    echo "Command available:"
    echo ""
    echo "login"
    echo "stat"
    echo "logout"
    echo "toggle"
    echo "getname"
    echo "import <name-config> <path-to-config-file>"
    exit 1
  }

  echoerr() { printf "%s\n" "$*" >&2; }

  function ovpnimport() {
    #   openvpn3 config-import
    configname=$1
    configfile=$2
    if [ -z $configname ]; then
        echoerr "Missing argument name: Please give us a name for your config"
        exit 128
    fi

    if [ -z $configfile ]; then
        echoerr "Missing argument filepath: Please give us the file path for your config"
        exit 128
    fi
    openvpn3 config-import --name "$configname" --config "$configfile"
  }

  function ovpnlogin() {
    openvpn3 session-start --config "$VPN_PATH/$CONFIG_NAME"
    echo -n "All done!"
  }

  function ovpnstat() {
    tmux rename-window vpn
    watch -n30 openvpn3 session-stats --config "$VPN_PATH/$CONFIG_NAME"
  }

  function ovpnlogout() {
    openvpn3 session-manage --config "$VPN_PATH/$CONFIG_NAME" -D
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
      "getname") ovpngetname;;
      "import") ovpnimport $2 $3;;
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

  [ -z "$CMD" ] && usage || parseArgs $@