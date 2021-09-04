pipeline {
    agent {
        label 'slaves'
    }

    stages {
        stage("Build Project") {
            steps {
                withMaven(maven: 'maven_3_8_2') {
                    sh 'mvn clean package'
                }
                stash includes: 'target/*.jar,Dockerfile', name: 'targetFileAndDockerFile'
            }
        }
        stage("Build Docker Image") {
            agent {
                label 'docker'
            }
            steps {
                unstash name: 'targetFileAndDockerFile'
                sh 'docker build -t prithuadhikary/docker-demo .'
            }
        }
    }

}