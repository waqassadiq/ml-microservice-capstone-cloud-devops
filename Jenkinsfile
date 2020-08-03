pipeline {
     agent any
     environment {
        registry = "qasibeat/capstonejenkinskubernetiesbuild"
        registryCredential = 'dockerhub'
        }
     stages {
           stage('setup') {
             steps {
                 sh 'echo "Setting up locall environment"'
                 sh '''   sudo apt-get update -y
                          sudo apt-get upgrade  -y
                          sudo apt-get install python3-venv -y
                          sudo python3 -m venv ~/.devops &&\
                          . ~/.devops/bin/activate
                          which python
                          sudo apt install python3-pip -y
                          sudo pip3 install --upgrade pip &&\
                          sudo pip3 install -r requirements.txt
                  '''
             }
         }        
         stage('Docker Installation') {
             steps {
                 sh 'echo "Docker installation"'
                 sh '''
                     sudo apt-get install curl apt-transport-https ca-certificates software-properties-common
                     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                     sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
                     sudo apt update
                     sudo apt-cache policy docker-ce
                     sudo apt install docker-ce -y
                     sudo systemctl status docker



                 '''
             }
         }
         stage('Lint Python files app.py') {
              steps {
                  sh 'pylint --disable=R,C,W1203 app.py'
              }
         }
        stage('build Docker Image') {
              steps {
                  sh './run_docker.sh'
              }
         }
        stage('upload to repo') {
              steps {
                  sh 'echo "trying loing from here "'
                  sh '''
                  dockerpath=qasibeat/capstonejenkinskubernetiesbuild
                  echo "Docker ID and Image: $dockerpath"
                  docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}
                  docker tag $dockerpath $dockerpath:latest
                  docker push $dockerpath
                  '''
                }
         }

         stage ('Create Kuberneties Custer'){
             sh 'echo "creating kuberneties cluster using EKSCTL"'
             sh '''
             eksctl create cluster \
             --name prod \
             --version 1.17 \
             --region us-west-2 \
             --nodegroup-name linux-nodes \
             --node-type t2.micro \
             --nodes 2 --nodes-min 1 \
             --nodes-max 2 \
             --ssh-access \
             --ssh-public-key jenkins-key-pair.pub \
             --managed
             '''
         }


     }
}
