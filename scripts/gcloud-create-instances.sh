#/bin/bash

# create k8s instances on GCP with gcloud
gcloud compute instances create k8-master --machine-type "e2-medium" --labels="k8s=master" --image-project "ubuntu-os-cloud" --image "ubuntu-2004-focal-v20200907" &>/dev/null
gcloud compute instances create k8-worker-01 --machine-type "e2-small" --labels="k8s=worker" --image-project "ubuntu-os-cloud" --image "ubuntu-2004-focal-v20200907" &>/dev/null
gcloud compute instances create k8-worker-02 --machine-type "e2-small" --labels="k8s=worker" --image-project "ubuntu-os-cloud" --image "ubuntu-2004-focal-v20200907" &>/dev/null

echo "instances created"

#filter instances by labels
gcloud compute instances list --filter="labels:k8s"

#filter instances to get the IP to populate ansible inventory
gcloud --format="value(networkInterfaces[0].accessConfigs[0].natIP)" compute instances list
