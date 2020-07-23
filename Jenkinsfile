pipeline {
     agent any
     stages {
          stage('setup') {
             steps {
                 sh 'python3 -m venv ~/.devops &&\'
                 sh 'source ~/.devops/bin/activate'
             }
         }
          stage('install') {
             steps {
                 sh 'pip install --upgrade pip &&\'
                 sh 'pip install -r requirements.txt'
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
