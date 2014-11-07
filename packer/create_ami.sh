#!/bin/bash

# This is the build that comes from Jenkins when called. We'll use this in the Packer JSON
MY_BUILD_DIR=$1/build/dist; export MY_BUILD_DIR
MY_BUILD_FILE=$2-$3.tar.gz; export MY_BUILD_FILE
MY_BUILD=$MY_BUILD_DIR/$MY_BUILD_FILE; export MY_BUILD
echo "This is the build: " $MY_BUILD
cd /home/provisioning/packer
echo "Launching packer to create webserver AMI"
/usr/local/packer/packer build -var-file=variables.json webserver-template.json 

