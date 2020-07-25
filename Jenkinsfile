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
                          // Install hadolint
                          sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
                          chmod +x /bin/hadolint

                 '''
             }
         }        
         stage('Build') {
             steps {
                 sh 'echo "Hello World"'
                 sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                 '''
             }
         }
         stage('Lint Python files app.py') {
              steps {
                  sh 'pylint --disable=R,C,W1203 app.py'
              }
         }
        stage('Lint Dockerfile') {
              steps {
                  sh 'hadolint Dockerfile'
              }
         }

     }
}
