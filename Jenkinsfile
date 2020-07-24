pipeline {
     agent any
     stages {
          stage('setup') {
             steps {
                 sudo sh 'echo "Setting up locall environment"'
                 sudo sh '''apt-get install python3-venv
                       python3 -m venv ~/.devops &&\
                       source ~/.devops/bin/activate
                       pip install --upgrade pip &&\
                       pip install -r requirements.txt
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
