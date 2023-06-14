#!/usr/bin/env bash

# enable ip packet forwarding
sysctl -w net.ipv4.conf.all.forwarding=1
sysctl -w net.ipv6.conf.all.forwarding=1

# enable ping broadcast response
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=0
# enable broadcast forwarding
sysctl -w net.ipv4.conf.all.bc_forwarding=1
sysctl -w net.ipv4.conf.eth0.bc_forwarding=1
sysctl -w net.ipv4.conf.eth1.bc_forwarding=1

# setup the siit nat64 prefix for mapping IPv4 and IPv6 addresses.
# This should be a common knowledge for all devices in the system.
jool_siit instance add --netfilter --pool6 fd00::/96