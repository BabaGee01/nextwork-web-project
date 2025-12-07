#!/bin/bash
set -e

# Detect Tomcat systemd service
TOMCAT_SERVICE=""
for svc in tomcat tomcat9 tomcat10; do
  if systemctl list-unit-files | grep -q "^${svc}.service"; then
    TOMCAT_SERVICE="$svc"
    break
  fi
done

if [ -z "$TOMCAT_SERVICE" ]; then
  echo "ERROR: Tomcat systemd unit not found (tried: tomcat, tomcat9, tomcat10)."
  echo "Make sure Tomcat is actually installed on this server."
  exit 1
fi

echo "Using Tomcat service: ${TOMCAT_SERVICE}.service"

sudo systemctl enable --now "${TOMCAT_SERVICE}.service"
sudo systemctl enable --now httpd.service
