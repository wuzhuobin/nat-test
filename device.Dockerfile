FROM ubuntu:22.04

RUN if [ -z ${http_proxy+x} ]; then echo "Acquire::http::Proxy \"${http_proxy}\";" >> /etc/apt/apt.conf; fi
RUN if [ -z ${https_proxy+x} ]; then echo "Acquire::https::Proxy \"${https_proxy}\";" >> /etc/apt/apt.conf; fi

RUN apt update
# install tools
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
  net-tools \
  iptables \
  iputils-ping \
  iproute2

RUN sysctl -w net.ipv4.conf.all.forwarding=0
RUN sysctl -w net.ipv6.conf.all.forwarding=0