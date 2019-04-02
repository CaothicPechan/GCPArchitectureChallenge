# Autor: CaothicPechan --- https://github.com/CaothicPechan
# Last update: 02/04/2019 
# This is a help for the people who are solving
# Qwiklabs GCP Architecture Challenge


# Configure a Firewall and a Startup Script with Deployment Manager
# https://google.qwiklabs.com/focuses/1736?parent=catalog

# You have been asked to develop a Deployment Manager template that 
# will be used to deploy and configure the Google Cloud environment 
# that is required to support this product. You must create this 
# template and test your deployment.

###############################################################


# Download the baseline templates: 
mkdir deployment_manager
cd deployment_manager
gsutil cp gs://spls/gsp302/* .

# Modify Jinja File { challenge_3_Lab.jinja }
    # Added on [compute] resources.properties:
    tags:
        items: ["http"]
    metadata:
      items:
      - key: startup-script
        value: "apt-get update \n apt-get install -y apache2"
    # Add resource
    - type: compute.v1.firewall
      name: http-firewall
      properties:
        targetTags: ["http"]
        sourceRanges: ["0.0.0.0/0"]
        allowed:
        - IPProtocol: TCP
          ports: ["80", "8080"]


# Create deploy
# gcloud deployment-manager deployments create [DEPLOY_NAME] --config [FILE_TEMPLATE]
# usefull:  gcloud deployment-manager deployments delete [DEPLOY_NAME]
gcloud deployment-manager deployments create deploy-qwik --config qwiklabs.yaml


