pipeline {
     agent any
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
                     sudo apt-get install docker-ce docker-ce-cli containerd.io -y
                 '''
             }
         }
         stage('Lint Python files app.py') {
              steps {
                  sh 'pylint --disable=R,C,W1203 app.py'
              }
         }
        stage('build Docker Imagee') {
              steps {
                  sh 'sudo ./run_docker.sh'
              }
         }

     }
}
