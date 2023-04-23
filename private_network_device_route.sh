#!/usr/bin/env bash

ip route add fd00::192.168.0.0/120 via fd00::192.168.3.10
ip route add 64:ff9b::/96 via fd00::192.168.5.10