source $PWD/configuration.sh

echo -e "»\n» Making a back-up of the Neutron metadata configurations\n»"

sudo mkdir -p $PWD/neutron/backup
sudo cp /etc/neutron/metadata_agent.ini $PWD/neutron/backup/

echo -e "»\n» Configuring the Neutron metadata agent\n»"

sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT verbose True
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT nova_metadata_ip $DRY_IP
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT metadata_proxy_shared_secret $NEUTRON_METADATA_SECRET

echo -e "»\n» Configuring the Neutron metadata authorization\n»"

sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT auth_uri $KEYSTONE_AUTH_URI
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT auth_url $KEYSTONE_AUTH_URL
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT auth_region $DRY_REGION
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT auth_plugin password
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT project_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT user_domain_id $DRY_ADMIN_DOMAIN
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT project_name $DRY_SERVICE_PROJECT
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT username neutron
sudo crudini --set /etc/neutron/metadata_agent.ini DEFAULT password $NEUTRON_PASS

echo -e "»\n» Configuring the Neutron metadata proxy for Nova\n»"

sudo crudini --set /etc/nova/nova.conf neutron service_metadata_proxy True
sudo crudini --set /etc/nova/nova.conf neutron metadata_proxy_shared_secret $NEUTRON_METADATA_SECRET
