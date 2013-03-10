#! /bin/bash

set -e

# Warm the PIP and APT cache
if [ $(ls -1 /vagrant/pip_cache/ | wc -l) -gt 0 ]
then
	mkdir -p /var/cache/pip
	cp /vagrant/pip_cache/* /var/cache/pip/
fi
if [ $(ls -1 /vagrant/apt_cache/ | wc -l) -gt 0 ]
then
	mkdir -p /var/cache/apt
	cp -R /vagrant/apt_cache/* /var/cache/apt/
fi

# Make apt faster!
sudo sed -i 's/http:\/\/us.archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/g' /etc/apt/sources.list

sudo apt-get update
sudo apt-get install -qqy git

# Fetch devstack folsom
git clone -b stable/folsom https://github.com/openstack-dev/devstack.git

# Copy conf to be used
cp /vagrant/devstack.conf devstack/localrc

# Launch devstack!
cd devstack
./stack.sh

#Copy back all PIP cache data to the shared folder, for subsequent use
cp /var/cache/pip/* /vagrant/pip_cache
cp -R /var/cache/apt/* /vagrant/apt_cache/ || true