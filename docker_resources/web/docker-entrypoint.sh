#!/bin/bash
set -e
composer install
wait-for-it.sh mysql.manuerumx.local:3306 -t 300
echo "MySQL connection established"
mysql -h mysql.manuerumx.local -u root -ppassword -e "source /root/db.sql"

# If needed, add more instructions here to create a env file
# Seed the database or run other commands required for the project

apache2-foreground
