# Autor: CaothicPechan --- https://github.com/CaothicPechan
# Last update: 02/04/2019 
# This is a help for the people who are solving
# Qwiklabs GCP Architecture Challenge

# Build and Deploy a Docker Image to a Kubernetes Cluster
# https://google.qwiklabs.com/focuses/1738?parent=catalog

# In this hands-on lab you will build a Docker container image 
# using a tag that allows it to be stored on the Google Container 
# Registry (GCR), then push it out to GCR before deploying. 
# Create a Kubernetes cluster and deploy the sample app to the cluster.

###############################################################


# Set ID=[ID_PROJECT]

# Dowload the package
# Alternative can copy the resources from the bucket
# gsutil cp gs://[BUCKET_NAME]/[FILE_NAME] [TARGET_PATH]
gsutil cp gs://$ID/resources-echo-web.tar.gz .

# Go to Cloud Shell

# Upload resource

# Extract resources 
# tar xzvf [FILE_NAME]
tar xzvf resources-echo-web.tar.gz

# Build & push image
# docker build  ------------ build image
# -t [TAG_NAME] ------------ set Tag for image
# [DOCKERFILE_PATH] -------- select Docker file 
docker build -t gcr.io/$ID/echo-app:v1 .
docker push gcr.io/$ID/echo-app:v1

# Config compute zone for use cluster
# gcloud config set compute/zone [ZONE]

gcloud config set compute/zone us-central1-a

# Create cluster
# gcloud container clusters create [CLUSTER_NAME]
gcloud container clusters create echo-cluster

# Get credentials from the cluster
# gcloud container clusters get-credentials [CLUSTER_NAME]
gcloud container clusters get-credentials echo-cluster

# Create the deploy for the cluster
# kubectl run [DEPLOY_NAME] --image=[IMAGE] --port=8080
kubectl run echo-app --image=gcr.io/$ID/echo-app:v1 --port=8080

# Check if deploy is ready
kubectl get pods

# Expose the deployment for web-request
# kubectl expose deployment [DEPLOY_NAME]--type=LoadBalancer --port [PORT] --target-port [TARGET_PORT]
kubectl expose deployment echo-app --type=LoadBalancer --port 80 --target-port 8000

# Check if it is ready
# The External ip will be in PENDING status until it is ready, check some times.
kubectl get service
