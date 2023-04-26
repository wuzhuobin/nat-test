#!/usr/bin/env bash

# Add a new route for routing to the public_network_device.
# fd00::192.168.3.10 is a IPv6 address of the gateway_siit's ethernet interface.
# fd00::192.168.0.0/120 is the network where the public_network_device is.
# So the private_network_device know the gateway_siit's ip address and the
# target network.
ip route add fd00::192.168.0.0/120 via fd00::192.168.3.10
# fd00::192.168.5.10 is a IPv6 address of the gateway_stateful's ethernet interface.
# 64:ff9b::/96 is the network where the public_network_device is.
# So the private_network_device know the gateway_stateful's ip address and the
# target network.
ip route add 64:ff9b::/96 via fd00::192.168.5.10