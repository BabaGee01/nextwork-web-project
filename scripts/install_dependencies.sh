#!/bin/bash
set -e

# Install Tomcat 9 and Apache HTTPD
sudo yum install -y tomcat9 httpd

# Create Apache vhost that proxies to Tomcat
sudo tee /etc/httpd/conf.d/tomcat_manager.conf > /dev/null << 'EOF'
<VirtualHost *:80>
  ServerAdmin root@localhost
  ServerName app.nextwork.com
  DefaultType text/html
  ProxyRequests off
  ProxyPreserveHost On

  ProxyPass / http://localhost:8080/nextwork-web-project/
  ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF

# Enable and restart Apache
sudo systemctl enable httpd
sudo systemctl restart httpd
