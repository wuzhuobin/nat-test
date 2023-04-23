#!/usr/bin/env bash

sysctl -w net.ipv4.conf.all.forwarding=1
sysctl -w net.ipv6.conf.all.forwarding=1

jool instance add --netfilter --pool6 64:ff9b::/96