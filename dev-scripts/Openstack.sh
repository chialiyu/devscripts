pip install python-openstackclient

#Activate virtualenv prod_cae
source ~/python27/bin/activate

#Source RC file to setup environment - Openstack_Template
source <connie-training-openrc.sh>

ssh -i <keyfile> cloud-user@<IP>

#Check environment variables
env | grep OS_

#Change key permission
chmod 400 <keyfile>

#
#Network/neutron
#

#List all networks
neutron net-list

##
## NOVA commands
#Dump progress
nova list
nova console-log <instancename>

##
## Swift commands
#
# CLI to get token
swift stat -v
swift list <container name>
swift upload <container name> <file>


b20e89bee4b647848699ad1eb3a90e59
