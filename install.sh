#!/bin/bash
#
PROJECT=${PROJECT:-$(gcloud config list --format 'value(core.project)' 2>/dev/null)}
ZONE=${ZONE:-$(gcloud config list --format 'value(compute.zone)' 2>/dev/null)}
MACHINE_TYPE=${MACHINE_TYPE:-n1-highcpu-2}
VM_NAME=${VM_NAME:-dev}

# Check for gcloud cli tool
gcloud version > /dev/null
exit_status=$?
if [ $exit_status -eq 1 ]; then
    echo "### This script requires the gcloud cli tool"
    echo "### Details: https://cloud.google.com/sdk/docs/"
    exit 1
fi

# See if $VM_NAME exists
gcloud compute instances list | grep $VM_NAME
exit_status=$?
if [ $exit_status -eq 0 ]; then
    echo "### VM \"$VM_NAME\" exists. Delete the VM or set a different VM name:"
    echo "### To delete the VM: gcloud compute instances delete $VM_NAME"
    echo "### To change the VM name used by this installer: export VM_NAME=my_vm"
    exit 1
fi

# Get the latest Ubuntu image.
echo "### Obtaining the latest Ubuntu Xenial image name..."
VM_IMAGE=$(gcloud compute images list --standard-images --filter=name~ubuntu-1604-xenial --limit=1 --uri)

# Create the gcloud compute instance.
echo "### Creating VM_NAME=$VM_NAME using VM_IMAGE=$VM_IMAGE"
gcloud compute instances create "$VM_NAME" --zone "$ZONE" --machine-type "$MACHINE_TYPE" \
--image "$VM_IMAGE" --project "$PROJECT"
sleep 5

echo "### Install complete. VM $VN_NAME status:"
gcloud compute instances list --filter="name=( '$VM_NAME' ... )"
