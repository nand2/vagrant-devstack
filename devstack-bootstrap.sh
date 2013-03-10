#! /bin/bash

set -e

# Make apt faster!
sudo sed -i 's/http:\/\/us.archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/g' /etc/apt/sources.list

sudo apt-get update
sudo apt-get install -qqy git

# Fetch ourselves
git clone https://github.com/nand2/vagrant-devstack.git

# Fetch devstack
git clone https://github.com/openstack-dev/devstack.git
cd devstack

# Copy conf to be used, todo: make that overridable
cp ~/vagrant-devstack/devstack.conf localrc

# Launch devstack!
yes '' | ./stack.sh