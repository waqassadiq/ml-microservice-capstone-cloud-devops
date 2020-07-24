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
                          source ~/.devops/bin/activate -y
                          sudo pip install --upgrade pip &&\
                          sudo pip install -r requirements.txt -y
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
     }
}
