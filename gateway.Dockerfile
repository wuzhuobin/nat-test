FROM ubuntu:22.04

RUN if [ -z ${http_proxy+x} ]; then echo "Acquire::http::Proxy \"${http_proxy}\";" >> /etc/apt/apt.conf; fi
RUN if [ -z ${https_proxy+x} ]; then echo "Acquire::https::Proxy \"${https_proxy}\";" >> /etc/apt/apt.conf; fi

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  net-tools \
  iptables \
  iputils-ping \
  iproute2 \
  curl \
  avahi-daemon \
  netcat \
  tcpdump \
  build-essential \
  pkg-config \
  libnl-genl-3-dev \
  libxtables-dev \
  autoconf \
  libtool

COPY Jool /tmp/Jool
WORKDIR /tmp/Jool
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

WORKDIR /