# Autor: CaothicPechan --- https://github.com/CaothicPechan
# Last update: 02/04/2019 
# This is a help for the people who are solving
# Qwiklabs GCP Architecture Challenge

# Scale Out and Update a Containerized Application on a Kubernetes Cluster
# https://google.qwiklabs.com/focuses/1739?parent=catalog

# This is a Challenge Lab where you must complete a series of tasks 
# within a limited time period. Instead of following step-by-step instructions, 
# you will be presented with a general objective, and will be scored 
# automatically based on your activity.

###############################################################

# Set ID=[ID_PROJECT]

# Dowload the package
# Alternative can copy the resources from the bucket
# gsutil cp gs://[BUCKET_NAME]/[FILE_NAME] [TARGET_PATH]
gsutil cp gs://$ID/echo-web-v2.tar.gz .

# Go to Cloud Shell

# Upload resource

# Extract resources 
# tar xzvf [FILE_NAME]
tar xzvf echo-web-v2.tar.gz



# Build & push image
# docker build  ------------ build image
# -t [TAG_NAME] ------------ set Tag for image
# [DOCKERFILE_PATH] -------- select Docker file 
docker build -t gcr.io/$ID/echo-app:v2 .
docker push gcr.io/$ID/echo-app:v2

# Alternative use Google Container builder, for build image from Dockerfile
# and then push it into cloud image repository
gcloud builds submit --tag gcr.io/$ID/echo-app:v2 .


# View google container registry images 
gcloud container images list

# View it by tag
# gcloud container images list-tags [HOSTNAME]/[PROJECT-ID]/[IMAGE]
gcloud container images list-tags gcr.io/$ID/echo-app

# Config compute zone for use cluster
# gcloud config set compute/zone [ZONE]

gcloud config set compute/zone us-central1-a

# View if cluster is running
# gcloud container clusters list
gcloud container clusters list

# Get credentials from the cluster
# gcloud container clusters get-credentials [CLUSTER_NAME]
gcloud container clusters get-credentials echo-cluster

# Edit the deploy, for use v2 image
# Modify for use v2 image
kubectl edit deployment echo-web

# Scale the deployment
kubectl scale deployment echo-web --replicas=2
