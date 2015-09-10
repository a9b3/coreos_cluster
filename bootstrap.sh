#!/bin/sh

echo "Starting bootstrap.sh..."

# confd

echo "Starting confd..."
# download confd move to bin
wget -O confd https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64
mkdir -p /opt/bin
cp confd /opt/bin/.
chmod +x /opt/bin/confd
mkdir -p /etc/confd/{conf.d,templates}
# copy conf.d files
cp /home/core/share/confd/nginx.toml /etc/confd/conf.d/.
cp /home/core/share/confd/nginx.tmpl /etc/confd/templates/.
echo "Finished confd..."

# nginx

# echo "Starting nginx..."
mkdir -p /etc/nginx/{sites-enabled,certs-enabled}
mkdir -p /var/log/nginx
# # nginx systemd
# cp /vagrant/services/nginx.service /etc/systemd/system/nginx.service
# systemctl enable /etc/systemd/system/nginx.service
# systemctl start nginx.service
# echo "Finished nginx..."

echo "Creating service symlink instances from template"
mkdir /home/core/share/instances
ln -s /home/core/share/templates/app@.service /home/core/share/instances/app@7777.service
ln -s /home/core/share/templates/app@.service /home/core/share/instances/app@7778.service
ln -s /home/core/share/templates/app-discovery@.service /home/core/share/instances/app-discovery@7777.service
ln -s /home/core/share/templates/app-discovery@.service /home/core/share/instances/app-discovery@7778.service

# App

# echo "Starting app..."
# cp /vagrant/services/app.service /etc/systemd/system/app_blue@9001.service
# cp /vagrant/services/app.service /etc/systemd/system/app_green@9002.service
# # app systemd
# systemctl enable /etc/systemd/system/app_blue@9001.service
# systemctl enable /etc/systemd/system/app_green@9002.service
# systemctl daemon-reload
# etcdctl set /app/instance none
# chmod 744 /vagrant/deploy_app.sh
# cp /vagrant/deploy_app.sh /opt/bin/.
# chmod +x /opt/bin/deploy_app.sh
# deploy_app.sh
# echo "Finished app..."

echo "Finished bootstrap.sh..."
