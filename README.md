Easy Openstack on VirtualBox
============================
Install the Folsom release of Openstack on Virtualbox thanks to Devstack (Openstack dev environment -- http://devstack.org/) and Vagrant (http://www.vagrantup.com/).

```
gem install vagrant
git clone https://github.com/nand2/vagrant-devstack.git
cd vagrant-devstack
./vbox-create-networks.sh # This will add 2 Host-only networks in VirtualBox (careful if you already have some)
vagrant up
```

Grab a cup of coffee while the monster installs itself. This will download around 400mb of data, and the whole process takes around 20 minutes with a 1Mb/s connection.
Once finished, you can access Horizon (Openstack web admin interface) at http://172.16.0.201/, with login: admin and pass: Xxdmpzmd32