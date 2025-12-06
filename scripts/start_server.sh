#!/bin/bash
set -e

# Start and enable Tomcat 9
sudo systemctl start tomcat9.service
sudo systemctl enable tomcat9.service

# Start and enable Apache HTTPD
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
