#!/usr/bin/env bash

sysctl -w net.ipv4.conf.all.forwarding=1
sysctl -w net.ipv6.conf.all.forwarding=1

jool_siit instance add --netfilter --pool6 fd00::/96