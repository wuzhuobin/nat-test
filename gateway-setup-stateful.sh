#!/usr/bin/env bash

# enable ip packet forwarding
sysctl -w net.ipv4.conf.all.forwarding=1
sysctl -w net.ipv6.conf.all.forwarding=1

# enable ping broadcast response
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=0

# setup the stateful nat64 prefix for mapping IPv4 addresses.
# This should be a common knowledge for all devices in the system.
jool instance add --netfilter --pool6 64:ff9b::/96