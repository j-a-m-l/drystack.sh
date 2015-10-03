source $PWD/configuration.sh

echo -e "»\n» Create the Public (external) network\n»"

neutron net-create --router:external \
	--provider:physical_network $NEUTRON_EXTERNAL_NET \
	--provider:network_type flat \
	$NEUTRON_PUBLIC_NET

neutron subnet-create --name $NEUTRON_PUBLIC_SUBNET_NAME \
	--disable-dhcp \
	--allocation_pool start=$NEUTRON_FLOATING_IP_START,end=$NEUTRON_FLOATING_IP_END \
	--gateway $NEUTRON_PUBLIC_SUBNET_GATEWAY \
	$NEUTRON_PUBLIC_NET $NEUTRON_PUBLIC_SUBNET_CIDR

echo -e "»\n» Create the Private (internal) network\n»"

neutron net-create $NEUTRON_PRIVATE_NET

neutron subnet-create --name $NEUTRON_PRIVATE_SUBNET_NAME \
	$NEUTRON_PRIVATE_NET $NEUTRON_PRIVATE_SUBNET_CIDR

echo -e "»\n» Create the router that connects the networks\n»"

neutron router-create $NEUTRON_ROUTER
neutron router-interface-add $NEUTRON_ROUTER $NEUTRON_PRIVATE_SUBNET_NAME
neutron router-gateway-set $NEUTRON_ROUTER $NEUTRON_PUBLIC_NET
