#!/bin/bash
# Update system
apt update -y
apt upgrade -y

# Install Apache and PHP with required extensions
apt install -y apache2 php php-mysql php-curl php-xml php-mbstring php-zip php-gd wget unzip

# Enable and start Apache
systemctl enable apache2
systemctl start apache2

# Download and extract WordPress
wget https://wordpress.org/latest.tar.gz -P /tmp
tar -xzf /tmp/latest.tar.gz -C /tmp
cp -r /tmp/wordpress/* /var/www/html/

# Set proper permissions
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Create wp-config.php from sample
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Configure wp-config.php with DB info
# Replace these with your values, or use templatefile() to inject via Terraform

DB_NAME="${db_name}"
DB_USER="${db_user}"
DB_PASSWORD="${db_password}"
DB_HOST="${db_host}"

sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wp-config.php
sed -i "s/username_here/$DB_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/" /var/www/html/wp-config.php
sed -i "s/localhost/$DB_HOST/" /var/www/html/wp-config.php

# Restart Apache to ensure everything is running
sudo rm /var/www/html/index.html
systemctl restart apache2
