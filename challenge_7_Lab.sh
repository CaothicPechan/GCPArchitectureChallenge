# Autor: CaothicPechan --- https://github.com/CaothicPechan
# Last update: 02/04/2019 
# This is a help for the people who are solving
# Qwiklabs GCP Architecture Challenge

# Migrate a MySQL Database to Google Cloud SQL
# https://google.qwiklabs.com/focuses/1740?parent=catalog

# Your challenge is to migrate the database to Google Cloud SQL 
# and then reconfigure the application so that it no longer relies 
# on the local MySQL database.

###############################################################

# Go to Cloud SQL

# Create new instance

# Create new User
# user: blogadmin
# pass: Password1*

# Create new Database "wordpress"
# create database [NAME]


# Go to connections tabs
# Create a new Network rule, allow [BLOG_IP]

# Go to blog instance and ssh

# Make a dump
mysqldump wordpress > bu.sql

# Make a Bucket
gsutil mb gs://mysqlbus

# Copy the dump to the bucket
gsutil cp bu.sql gs://mysqlbus

# Go in Cloud SQL to Import option
# Select the file from the bucket
# Select Database
# GO


# Edit the config file in the instance
# Path: /var/www/html/wordpress/wp-config.php
sudo nano /var/www/html/wordpress/wp-config.php

# Change DB_HOST for the DATABASE PUBLIC IP

# In the instance, restart the apache service
sudo service apache2 restart