#!/bin/bash

# Set the text color for prompts
# requiring the user's feedback.
BLUE='\033[1;34m'
NC='\033[0m'

# Update package installer and
# install nginx.
apt-get autoclean && apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
apt-get install -qq nginx

# Disable root login.
sed -i "34s~.*~PermitRootLogin no~" /etc/ssh/sshd_config
systemctl reload sshd

# Simple firewall setup using ufw.
ufw allow OpenSSH
ufw allow 'Nginx Full'
echo "y" | ufw enable

# Configure Nginx.
mv ./config_files/jup_trading_lab /etc/nginx/sites-available/jup_trading_lab

# Collect the values associated with
# the method that will be used to
# access the server.
echo -e "${BLUE}To configure Nginx we'll need to know how you plan to access your remote trading lab."
read -p $'\x0aDo you want to access your remote trading lab using the ip address? [Y/n] ' ip_response
if [ "${ip_response^^}" = "Y" ]; then
  read -p $'\x0aWhat is the ip address? ' ip_address
fi

read -p $'\x0aDo you have a domain name that you would like to use to access your remote trading lab? [Y/n] ' domain_response
if [ "${domain_response^^}" = "Y" ]; then
  read -p $'\x0aWhat is the domain? ' domain_name
fi

if [ "${ip_response^^}" = "Y" ] && [ "${domain_response^^}" = "Y" ]; then
  echo -e "${NC}"
  sed -i "13s~.*~        server_name $ip_address $domain_name;~" /etc/nginx/sites-available/jup_trading_lab
elif [ "${ip_response^^}" = "Y" ]; then
  echo -e "${NC}"
  sed -i "13s~.*~        server_name $ip_address;~" /etc/nginx/sites-available/jup_trading_lab
else
  echo -e "${NC}"
  sed -i "13s~.*~        server_name $domain_name;~" /etc/nginx/sites-available/jup_trading_lab
fi

ln -s /etc/nginx/sites-available/jup_trading_lab /etc/nginx/sites-enabled
systemctl restart nginx

# Build the Jupyter Lab Docker Image
bash ./config_files/build_image.sh

# End set up script
echo -e "${BLUE}Your droplet has successfully been set up.${NC}"
