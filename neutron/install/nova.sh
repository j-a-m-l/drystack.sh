source $PWD/configuration.sh

echo -e "»\n»Configuring the Nova for Neutron\n»"

sudo crudini --set /etc/nova/nova.conf DEFAULT network_api_class nova.network.neutronv2.api.API
sudo crudini --set /etc/nova/nova.conf DEFAULT security_group_api neutron
sudo crudini --set /etc/nova/nova.conf DEFAULT linuxnet_interface_driver nova.network.linux_net.LinuxOVSInterfaceDriver
# Disables the Nova internal firewall, so it's replaced by the Neutron one
sudo crudini --set /etc/nova/nova.conf DEFAULT firewall_driver nova.virt.firewall.NoopFirewallDriver

echo -e "»\n»Configuring the Neutron authentication for Nova\n»"

sudo crudini --set /etc/nova/nova.conf neutron url $NEUTRON_ENDPOINT
sudo crudini --set /etc/nova/nova.conf neutron auth_strategy keystone
sudo crudini --set /etc/nova/nova.conf neutron admin_auth_url $KEYSTONE_ADMIN_URL
sudo crudini --set /etc/nova/nova.conf neutron admin_tenant_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/nova/nova.conf neutron admin_username neutron
sudo crudini --set /etc/nova/nova.conf neutron admin_password $NEUTRON_PASS
