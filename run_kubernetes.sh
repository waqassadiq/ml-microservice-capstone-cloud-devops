#!/usr/bin/env bash

## Complete the following steps to get Kuberneties cluster running on aws

# Step 1:
# Check your user
whoami

# Step 3:
pwd
# Step 2:
ls -l
# Step 4

## check rolels
aws sts get-caller-identity
# Step 3: 
# run the following command
eksctl create cluster --name eks-capestone --version 1.17 --region us-west-2 --nodegroup-name linux-nodes --node-type t2.micro --nodes 2 --nodes-min 1 --nodes-max 2 --ssh-access --ssh-public-key /var/lib/jenkins/jenkins-key-pair.pub --managed