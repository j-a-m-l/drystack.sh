echo -e "»\n» Create the 'open' security group\n»"

neutron security-group-create open --description "Open all things!"

nova secgroup-add-rule open icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule open tcp 22 22 0.0.0.0/0
nova secgroup-add-rule open tcp 80 80 0.0.0.0/0
nova secgroup-add-rule open tcp 443 443 0.0.0.0/0

neutron security-group-show open
