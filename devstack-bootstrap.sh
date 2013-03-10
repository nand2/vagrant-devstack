#! /bin/bash

set -e

# Make apt faster!
sudo sed -i 's/http:\/\/us.archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/g' /etc/apt/sources.list

sudo apt-get update
sudo apt-get install -qqy git

# Fetch ourselves
git clone https://github.com/nand2/vagrant-devstack.git

# Fetch devstack folsom
git clone -b stable/folsom https://github.com/openstack-dev/devstack.git

# Copy conf to be used, todo: make that overridable
cp vagrant-devstack/devstack.conf devstack/localrc

# Launch devstack!
cd devstack
yes '' | ./stack.sh