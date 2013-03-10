#! /bin/bash

set -e

apt-get update
apt-get install -qqy git
git clone https://github.com/openstack-dev/devstack.git
cd devstack
