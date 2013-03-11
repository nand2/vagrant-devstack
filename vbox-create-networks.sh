#!/bin/bash

# Private Network  vboxnet0 (172.16.0.0/16)
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 172.16.0.254 --netmask 255.255.0.0

# Public Network vboxnet1 (10.10.0.0/16)
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet1 --ip 10.10.0.1 --netmask 255.255.0.0

