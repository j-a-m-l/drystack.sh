source $PWD/admin-openrc.sh

# Options for installing and configuring OpenStack

DRY_HOST='lab'

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
NEUTRON_EXTERNAL_NET='ExternalNet'
NEUTRON_INTERNAL_NET='InternalNet'
NEUTRON_EXTERNAL_BRIDGE='br-ex'
NEUTRON_INTERNAL_BRIDGE='br-em1'
NEUTRON_VLAN_RANGE='100:200'
NEUTRON_METADATA_SECRET='Lost Art of Keeping a Secret'
