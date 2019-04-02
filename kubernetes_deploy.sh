####### 
# Lab Challenge Kubernetes
#######
# Unzip code
tar xzvf echo-web-v2.tar.gz
# Build & push image
docker build -t gcr.io/$ID/echo-app:v2 .
docker push gcr.io/$ID/echo-app:v2
# Config for use cluster
gcloud config set compute/zone us-central1-a
gcloud container clusters get-credentials echo-cluster
# Edit the deploy, for use v2 image
kubectl edit deployment echo-web
# Scale the deployment
kubectl scale deployment echo-web --replicas=2


###################

# Import image to local Docker
docker import [path]

# Check id for the local image
docker image list

# Nice labs https://www.qwiklabs.com/focuses/639?parent=catalog
# For google cloud porpuse host name for pushing the images is like: gcr.io
# Tag image
docker tag [SOURCE_IMAGE | ID_IMAGE] [HOSTNAME]/[PROJECT-ID]/[IMAGE]:[TAG]

# Push image
docker push [HOSTNAME]/[PROJECT-ID]/[IMAGE]:[TAG]

# View google container registry images 
gcloud container images list

# View it by tag
gcloud container images list-tags [HOSTNAME]/[PROJECT-ID]/[IMAGE]

###################
# Setting compute zone
gcloud config set compute/zone [ZONE]  # us-central1-a

# Create a cluster, if it is necesary
gcloud container clusters create [CLUSTER-NAME]

# Get credentials for cluster
gcloud container clusters get-credentials [CLUSTER-NAME]