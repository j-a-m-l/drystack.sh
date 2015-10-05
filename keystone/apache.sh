source $PWD/configuration.sh

# echo -e "»\n»Configuring Apache for Keystone\n»"
# 
# echo -e "ServerName $KEYSTONE_SERVER_NAME" | sudo tee -a /etc/apache2/apache2.conf
# 
# echo '
# Listen 5000
# Listen 35357
# 
# <VirtualHost *:5000>
#     WSGIDaemonProcess keystone-public processes=5 threads=1 user=keystone display-name=%{GROUP}
#     WSGIProcessGroup keystone-public
#     WSGIScriptAlias / /var/www/cgi-bin/keystone/main
#     WSGIApplicationGroup %{GLOBAL}
#     WSGIPassAuthorization On
#     <IfVersion >= 2.4>
#       ErrorLogFormat "%{cu}t %M"
#     </IfVersion>
#     LogLevel info
#     ErrorLog /var/log/apache2/keystone-error.log
#     CustomLog /var/log/apache2/keystone-access.log combined
# </VirtualHost>
# 
# <VirtualHost *:35357>
#     WSGIDaemonProcess keystone-admin processes=5 threads=1 user=keystone display-name=%{GROUP}
#     WSGIProcessGroup keystone-admin
#     WSGIScriptAlias / /var/www/cgi-bin/keystone/admin
#     WSGIApplicationGroup %{GLOBAL}
#     WSGIPassAuthorization On
#     <IfVersion >= 2.4>
#       ErrorLogFormat "%{cu}t %M"
#     </IfVersion>
#     LogLevel info
#     ErrorLog /var/log/apache2/keystone-error.log
#     CustomLog /var/log/apache2/keystone-access.log combined
# </VirtualHost>' | sudo tee /etc/apache2/sites-available/wsgi-keystone.conf
#  
# sudo ln -s /etc/apache2/sites-available/wsgi-keystone.conf /etc/apache2/sites-enabled
# 
# sudo mkdir -p /var/www/cgi-bin/keystone
# 
# curl http://git.openstack.org/cgit/openstack/keystone/plain/httpd/keystone.py?h=stable/kilo \
#   | sudo tee /var/www/cgi-bin/keystone/main /var/www/cgi-bin/keystone/admin
# 
# sudo chown -R keystone:keystone /var/www/cgi-bin/keystone
# sudo chmod 755 /var/www/cgi-bin/keystone/*
