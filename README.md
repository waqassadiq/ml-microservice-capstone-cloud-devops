[![CircleCI](https://circleci.com/gh/waqassadiq/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/waqassadiq/project-ml-microservice-kubernetes)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks Completed


Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

### Minikube step
waqassadiq (master *) project-ml-microservice-kubernetes
$ minikube start
😄  minikube v1.12.0 on Darwin 10.15.5
✨  Using the docker driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🔄  Restarting existing docker container for "minikube" ...
🐳  Preparing Kubernetes v1.18.3 on Docker 19.03.2 ...
🔎  Verifying Kubernetes components...
🌟  Enabled addons: default-storageclass, storage-provisioner
🏄  Done! kubectl is now configured to use "minikube"

waqassadiq (master *) project-ml-microservice-kubernetes
$ kubectl port-forward project4attempt2-56f6f56648-xxt7b  8000:80

after calling ./make_prediction.sh 

result:
$ kubectl port-forward project4attempt2-56f6f56648-xxt7b  8000:80
Forwarding from 127.0.0.1:8000 -> 80
Forwarding from [::1]:8000 -> 80
Handling connection for 8000
Handling connection for 8000
Handling connection for 8000

### Printing the kuberneties logs

### how to create a kuberneties cluster on AWS via ekctl (using cloudformation in the background)

eksctl create cluster \
--name prod \
--version 1.17 \
--region us-west-2 \
--nodegroup-name linux-nodes \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 2 \
--ssh-access \
--ssh-public-key jenkins-key-pair.pub \
--managed

### how to uplload file to ec2 instance
scp -i (your key file )  (your file to copy) (your ec2 instance) (location on ec2)
scp -i ec2-jenkins-keypair.pem jenkins-key-pair.pub ubuntu@ec2-34-215-255-178.us-west-2.compute.amazonaws.com:/home/ubuntu/

### Jenkins commands 
sudo systemctl restart jenkins

### Prune unused Docker objects

## Prune images
docker image prune

To remove all images which are not used by existing containers, use the -a flag:
docker image prune -a

## Prune containers
docker container prune

## Prune volumes
docker volume prune

## Prune networks
docker network prune

## Prune everything
docker system prune