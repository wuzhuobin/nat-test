#!/usr/bin/env bash

# Add a new route for routing to the private_network_device.
# 192.168.0.10 is a IPv4 address of the gateway_siit's ethernet interface.
# 192.168.3.0/24 is the network where the private_network_device is.
# So the public_network_device should know the gateway_siit's ip address and the
# target network.
ip route add 192.168.3.0/24 via 192.168.0.10

ip route add 169.254.0.0/16 via 192.168.0.30