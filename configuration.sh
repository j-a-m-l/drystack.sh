source $PWD/admin-openrc.sh

# Options for installing and configuring OpenStack

DRY_HOST='lab'

# Interface that connects to the machine
DRY_HOST_INTERFACE='em1'
DRY_HOST_IP='192.168.1.80'
DRY_HOST_NETWORK='192.168.1.0'
DRY_HOST_GATEWAY='192.168.1.254'
DRY_HOST_NETMASK='255.255.255.0'
DRY_HOST_BROADCAST='192.168.1.255'

# Interface that connects to OVS, instances, etc.
DRY_OVS_INTERFACE='em2'
DRY_OVS_IP='192.168.1.81'
DRY_OVS_NETWORK=$DRY_HOST_NETWORK
DRY_OVS_GATEWAY=$DRY_HOST_GATEWAY
DRY_OVS_NETMASK=$DRY_HOST_NETMASK
DRY_OVS_BROADCAST=$DRY_HOST_BROADCAST

# MariaDB
ROOT_DB_PASS='My&Maria'
DB_IP=$DRY_IP

# RabbitMQ
RABBIT_USER='openstack'
RABBIT_PASS='carrot'

# Useful during installation
DRY_VERBOSE='True'

# Configuration options for all services
DRY_REGION='RegionOne'

# Keystone
KEYSTONE_DB_PASS='yeah-keystone-lol'
# Use your host
KEYSTONE_SERVER_NAME=$DRY_HOST
KEYSTONE_INTERNAL_URL="http://$DRYIP:5000/v2.0"
KEYSTONE_PUBLIC_URL="http://$DRY_IP:5000/v2.0"
KEYSTONE_ADMIN_URL=$OS_AUTH_URL

# Glance
GLANCE_PASS='glande-jajaja'
GLANCE_DB_PASS=$GLANCE_PASS
GLANCE_ENDPOINT="http://$DRY_IP:9292"
GLANCE_EXAMPLE_IMAGE_FILE='trusty-server-cloudimg-amd64-disk1.img'
GLANCE_EXAMPLE_IMAGE_URL="http://cloud-images.ubuntu.com/trusty/current/$GLANCE_EXAMPLE_IMAGE_FILE"

# Nova
NOVA_PASS='new-super-nova'
NOVA_DB_PASS=$NOVA_PASS
NOVA_URL="http://$DRY_IP:8774/v2"
NOVA_ENDPOINT="$NOVA_URL/%(tenant_id)s"
NOVA_SERVER_NAME=$DRY_HOST
NOVA_NON_VNC_URL="http://$DRY_IP:6080/vnc_auto.html"

# Neutron
NEUTRON_PASS='nooooo-neutr0n-nooooooooo'
NEUTRON_DB_PASS=$NEUTRON_PASS
NEUTRON_ENDPOINT="http://$DRY_IP:9696"
NEUTRON_SERVER_NAME=$DRY_HOST
NEUTRON_NON_VNC_URL="http://$DRY_IP:6080/vnc_auto.html"
NEUTRON_METADATA_SECRET='Lost Art of Keeping a Secret'
# Physical networks
NEUTRON_FLAT_NET='ExternalNet'
NEUTRON_FLAT_BRIDGE='br-ex'
# NEUTRON_VLAN_NET='InternalNet'
# NEUTRON_VLAN_BRIDGE="br-$DRY_OVS_INTERFACE"
# NEUTRON_VLAN_RANGE='100:200'

# Public network
NEUTRON_PUBLIC_NET='public'
NEUTRON_PUBLIC_SUBNET_NAME=$NEUTRON_PUBLIC_NET
NEUTRON_PUBLIC_SUBNET_CIDR="$DRY_HOST_NETWORK/24"
NEUTRON_FLOATING_IP_START='192.168.1.101'
NEUTRON_FLOATING_IP_END='192.168.1.200'

# Private network
NEUTRON_PRIVATE_NET='private'
NEUTRON_PRIVATE_SUBNET_NAME=$NEUTRON_PRIVATE_NET
NEUTRON_PRIVATE_SUBNET_CIDR='10.0.0.0/24'
NEUTRON_PRIVATE_SUBNET_GATEWAY='10.0.0.1'

# Router that connects public and private networks
NEUTRON_ROUTER='unique-router'
