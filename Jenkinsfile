pipeline {
     agent any
     stages {
          stage('setup') {
             steps {
                 sh 'echo "Setting up locall environment"'
                 sh '''
                          sudo -n apt-get update
                          sudo -n apt-get upgrade  
                          sudo -n apt-get install python3-venv
                          sudo -n python3 -m venv ~/.devops &&\
                          source ~/.devops/bin/activate
                          sudo -n pip install --upgrade pip &&\
                          sudo -n pip install -r requirements.txt
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
