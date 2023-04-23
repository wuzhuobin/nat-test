# nat-test

## Steps for Creating a playground

### 1. Install in host

```bash
# Install jool kernel module only
sudo ./install-jool-kmod.sh

# Install express dependencies
cd http-server && npm install && cd -
```

### 2. Enable docker compose services

```bash
# Use docker compose V2
docker compose up -d
```

### 3. Get into different devices
```bash
docker compose exec -it public_network_device bash

docker compose exec -it gateway bash

docker compose exec -it private_network_device bash
```


### [Reference Only](https://www.jool.mx/en/documentation.html)
```bash
# Install dependencies for both user space apps and kernel module
sudo apt install -y \
  build-essential \
  pkg-config \
  linux-headers-$(uname -r) \
  libnl-genl-3-dev \
  libxtables-dev \
  autoconf \
  libtool \
  dkms

# Install from sources
git clone https://github.com/NICMx/Jool.git
cd Jool
./autogen.sh
./configure
make && sudo make install
```
