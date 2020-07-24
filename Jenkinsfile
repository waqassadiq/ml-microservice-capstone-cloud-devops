pipeline {
     agent any
     stages {
          stage('setup') {
             steps {
                 sh 'echo "Setting up locall environment"'
                 sh '''   jenkins ALL=(ALL) NOPASSWD: ALL
                          sudo apt-get update
                          sudo apt-get upgrade  
                          sudo apt-get install python3-venv
                          sudo python3 -m venv ~/.devops &&\
                          sudo source ~/.devops/bin/activate
                          sudo pip install --upgrade pip &&\
                          sudo pip install -r requirements.txt
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
