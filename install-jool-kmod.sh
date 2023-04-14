#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

apt update
apt install -y \
  build-essential \
  linux-headers-$(uname -r) \
  autoconf \
  libtool \
  dkms

if [ ! -d /lib/modules/$(uname -r) ]; then
  KMODULE_PATHS=( $(ls -d /lib/modules/*) )
  if [ ${#KMODULE_PATHS[@]} -lt 1 ]; then
    echo "No kmodules path found."
    exit 1
  fi
  KMODULE_PATH=${KMODULE_PATHS[0]}
  ln -s $KMODULE_PATH /lib/modules/$(uname -r)
fi

dkms install Jool --kernelsourcedir=/usr/src/linux-headers-$(uname -r)
modprobe jool
modprobe jool-siit