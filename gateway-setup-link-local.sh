#!/usr/bin/env bash

# enable ping broadcast response
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=0

# enable broadcast forwarding
sysctl -w net.ipv4.conf.all.bc_forwarding=1
sysctl -w net.ipv4.conf.eth0.bc_forwarding=1
sysctl -w net.ipv4.conf.eth1.bc_forwarding=1