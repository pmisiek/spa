pipeline {
  environment {
    registry = "pmisiek/spa-app-image" //Repository information, in this case hub.docker.com (docker_hub_account/repository_name).
    registryCredential = 'dockerhub' //Credential to log in registry. You have to create in Jenkins with id dockerhub
    dockerImage = ''
  }
  agent any
  stages {
    stage('Git checkout') {
      steps {
        git 'https://github.com/pmisiek/spa.git'
      }
    }
    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) { //Push image to default dockerhub repository
            dockerImage.push()
          }
        }
      }
    }
  }
}
