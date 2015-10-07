#
# Values for installing and configuring OpenStack
#

# Some clients has problems without this
export LC_ALL=C

# IP of the unique node (localhost is enough)
DRY_IP='127.0.0.1'
DRY_HOST='lab'

# Admin configuration and credentials
DRY_ADMIN_DOMAIN='default'
DRY_ADMIN_PROJECT='admin'
DRY_ADMIN_EMAIL='admin@example.net'
DRY_ADMIN_USER='admin'
DRY_ADMIN_PASS='admin'

# This project contains a unique user for each service
DRY_SERVICE_PROJECT='service'

# It is better to avoid touching $OS_* variables
DRY_AUTH_URL="http://$DRY_IP:35357"
DRY_REGION='RegionOne'

DRY_TEMPORAL_TOKEN='ADMIN'
DRY_TEMPORAL_URL="http://$DRY_IP:35357/v2.0"

# MariaDB
ROOT_DB_PASS='My^Maria'
DB_IP=$DRY_IP
DB_HOST=$DRY_IP

# RabbitMQ
RABBIT_USER='openstack'
RABBIT_PASS='carrot'

# Useful during installation
DRY_VERBOSE='True'

# It is used in a lot of service configurations
KEYSTONE_AUTH_URI="http://$DRY_IP:5000"
KEYSTONE_AUTH_URL="http://$DRY_IP:35357"

# Keystone
KEYSTONE_DB_PASS='yeah-keystone-lol'
# Use your host
KEYSTONE_SERVER_NAME=$DRY_HOST
KEYSTONE_INTERNAL_URL="http://$DRY_IP:5000/v2.0"
KEYSTONE_PUBLIC_URL="http://$DRY_IP:5000/v2.0"
KEYSTONE_ADMIN_URL="http://$DRY_IP:35357/v2.0"

# Glance
GLANCE_PASS='its-like-glande'
GLANCE_DB_PASS=$GLANCE_PASS
GLANCE_ENDPOINT="http://$DRY_IP:9292"
GLANCE_EXAMPLE_IMAGE_FILE='trusty-server-cloudimg-amd64-disk1.img'
GLANCE_EXAMPLE_IMAGE_URL="http://cloud-images.ubuntu.com/trusty/current/$GLANCE_EXAMPLE_IMAGE_FILE"
GLANCE_EXAMPLE_IMAGE_NAME="Ubuntu 14.04 3 - Cloud Image"

# Nova
NOVA_PASS='new-super-nova'
NOVA_DB_PASS=$NOVA_PASS
NOVA_URL="http://$DRY_IP:8774/v2"
NOVA_ENDPOINT="$NOVA_URL/%(tenant_id)s"
NOVA_NON_VNC_URL="http://$DRY_IP:6080/vnc_auto.html"

# Neutron
NEUTRON_PASS='nooooo-neutr0n-nooooooooo'
NEUTRON_DB_PASS=$NEUTRON_PASS
NEUTRON_ENDPOINT="http://$DRY_IP:9696"
NEUTRON_NON_VNC_URL="http://$DRY_IP:6080/vnc_auto.html"
NEUTRON_METADATA_SECRET='Lost Art of Keeping a Secret'

# Interface that connects to the machine
DRY_EX_INTERFACE='em1'
DRY_EX_IP='192.168.1.80'
DRY_EX_NETWORK='192.168.1.0'
DRY_EX_GATEWAY='192.168.1.254'
DRY_EX_NETMASK='255.255.255.0'
DRY_EX_BROADCAST='192.168.1.255'

# Interface that connects to OVS, instances, etc.
DRY_VINT_INTERFACE='em2'
DRY_VINT_IP='192.168.1.81'
DRY_VINT_NETWORK=$DRY_EX_NETWORK
DRY_VINT_GATEWAY=$DRY_EX_GATEWAY
DRY_VINT_NETMASK=$DRY_EX_NETMASK
DRY_VINT_BROADCAST=$DRY_EX_BROADCAST

# Networks
NEUTRON_FLAT_NET='ExternalNet'
NEUTRON_FLAT_BRIDGE='br-ex'
NEUTRON_VLAN_NET='InternalNet'
NEUTRON_VLAN_BRIDGE="br-$DRY_VINT_INTERFACE"
NEUTRON_VLAN_RANGE='100:200'

# Public network
NEUTRON_PUBLIC_NET='public'
NEUTRON_PUBLIC_SUBNET_NAME=$NEUTRON_PUBLIC_NET
NEUTRON_PUBLIC_SUBNET_CIDR="$DRY_EX_NETWORK/24"
NEUTRON_FLOATING_IP_START='192.168.1.101'
NEUTRON_FLOATING_IP_END='192.168.1.200'

# Private network
NEUTRON_PRIVATE_NET='private'
NEUTRON_PRIVATE_SUBNET_NAME=$NEUTRON_PRIVATE_NET
NEUTRON_PRIVATE_SUBNET_CIDR='10.0.0.0/24'
NEUTRON_PRIVATE_SUBNET_GATEWAY='10.0.0.1'

# Router that connects public and private networks
NEUTRON_ROUTER='unique-router'

# Cinder
CINDER_PASS='cindeR-cider'
CINDER_DB_PASS=$CINDER_PASS
CINDER_URL="http://$DRY_IP:8776/v2"
CINDER_ENDPOINT="$CINDER_URL/%(tenant_id)s"
CINDER_CPU_THREADS=2

# Horizon
# ...

__os__() {
	openstack --os-auth-type password \
	--os-auth-url $DRY_AUTH_URL \
	--os-project-name $DRY_ADMIN_PROJECT \
	--os-username $DRY_ADMIN_USER \
	--os-password $DRY_ADMIN_PASS \
	"$@"
}
