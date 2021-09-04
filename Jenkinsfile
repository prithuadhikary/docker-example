pipeline {
    agent {
        label 'slaves'
    }

    stages {
        stage("Build Project") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/prithuadhikary/docker-example.git']]])
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
                sh 'docker build -t prithuadhikary/docker-demo:1.2 .'
                sh 'docker stack deploy -c docker-compose.yaml opabs'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }

}