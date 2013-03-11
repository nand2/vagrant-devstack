Easy Openstack on VirtualBox
============================
Install the Folsom release of Openstack on Virtualbox thanks to Devstack (Openstack dev environment -- http://devstack.org/) and Vagrant (http://www.vagrantup.com/).

```
$ gem install vagrant
$ git clone https://github.com/nand2/vagrant-devstack.git
$ cd vagrant-devstack
$ ./vbox-create-networks.sh # This will add 2 Host-only networks in VirtualBox (careful if you already have some)
$ vagrant up
```

Grab a cup of coffee while the monster installs itself. This will download around 400mb of data, and the whole process takes around 20 minutes with a 1Mb/s connection.

Once finished, you can access Horizon (Openstack web admin interface) at http://172.16.0.201/, with login: admin and pass: Xxdmpzmd32

Your first VM
-------------
Go to http://172.16.0.201/nova/access_and_security/, click on "Edit Rules" of the "default" Security Group. Add a rule, protocol TCP, from port 22, to port 22, and keep the default values for the others fields. This will open the SSH port for our VM.

Go to http://172.16.0.201/nova/instances/, click "Launch instance". Select "cirros-xxx" in the Image field, choose your instance name, keep the "m1.tiny flavor". In "Access & Security", create a new keypair, paste in the content of your .ssh/id_rsa.pub key. Then finally click "Launch" to create your VM.

If everything goes well, your VM will have a status of "Active". In the "Actions" area, select "Associate floating IP", validate, and your VM will get a floating (public) IP, such as 10.10.1.1.

```
$ ssh cirros@10.10.1.1
The authenticity of host '10.10.1.1 (10.10.1.1)' can't be established.
RSA key fingerprint is 57:dd:5c:9e:8a:c9:c5:26:63:3b:b2:f7:6f:3d:6a:66.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.10.1.1' (RSA) to the list of known hosts.
$
```
And you're in your first VM!