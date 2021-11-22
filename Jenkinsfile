pipeline {
    agent any

    stages {
        stage('clone code') {
            steps {
                git branch: 'master', url: 'https://github.com/Waliaajooni/frontend.git'
            }
        }
        stage('build code') {
            steps {
                sh "mvn clean install"
            }
        }
	      
        stage('Test') {
            steps {
                echo "testing application"
            }
        }
}
