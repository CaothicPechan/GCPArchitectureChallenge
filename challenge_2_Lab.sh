# Autor: CaothicPechan --- https://github.com/CaothicPechan
# Last update: 02/04/2019 
# This is a help for the people who are solving
# Qwiklabs GCP Architecture Challenge


# Deploy a Compute Instance with a Remote Startup Script
# https://google.qwiklabs.com/focuses/1735?parent=catalog

# Configure a Linux Google Compute Engine instance that 
# installs an Apache web server software using a remote startup script, 
# then confirm that Apache has successfully installed.

###############################################################

# Upload the startup script to console
## Set ID=ProjectID

# Create a Bucket
# gsutil mb gs://[BUCKET_NAME]
gsutil mb gs://$ID

# Copy script into the bucket and set publick permissions
# gsutil acl ch -u AllUsers:R gs://[BUCKET_NAME]/[OBJECT_NAME]
gsutil acl ch -u AllUsers:R gs://$ID/resources-install-web.sh


# Create Instance from console, setting up: 
# Advanced options > Metadata
#   { key: startup-script-url, value: gs://$ID/resources-install-web.sh }
