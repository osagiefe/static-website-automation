#!/bin/bash
set -e

sudo apt update -y
sudo apt install -y apache2 git

sudo systemctl stop apache2

sudo rm -rf /var/www/html/*
rm -rf /tmp/static-website-automation

git clone https://github.com/osagiefe/static-website-automation.git /tmp/static-website-automation

sudo cp -r /tmp/static-website-automation/* /var/www/html/

sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

sudo systemctl enable apache2
sudo systemctl start apache2

echo "Website deployment completed successfully."