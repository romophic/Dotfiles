#!/bin/bash

function get_ip_wlan() {
  no_of_broadcasts="$(ifconfig | grep broadcast | wc -l)"
  if [ $no_of_broadcasts -gt "0" ]; then
    ip="$(ifconfig | grep broadcast | awk '{print $2}' | tail -n1)"
  fi
}

function get_ip_eth() {
  ip="$(ifconfig | grep ether | awk '{print $2}')"
  if [[ $ip != *"."* ]]; then
    ip=""
  fi
}

function print_ip() {
  get_ip_wlan
  if [ ! -z "$ip" ]; then
    echo "$ip"
  else
    get_ip_eth
    if [ ! -z "$ip" ]; then
      echo $ip
    else
      echo ""
    fi
  fi
}

print_ip
