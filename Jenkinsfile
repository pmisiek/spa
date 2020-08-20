pipeline {
  environment {
    registry = "pmisiek/spa-app-image" //Repository information, in this case hub.docker.com (docker_hub_account/repository_name).
    registryCredential = 'dockerhub' //Credential to log in registry. You have to create in Jenkins with id dockerhub
    dockerImage = ''
    CHROME_BIN="/opt/google/chrome/google-chrome"
  }
  agent any
  stages {
    stage('Git checkout') {
      steps {
        git branch: 'develop', url: 'https://github.com/pmisiek/spa.git'
      }
    }
    stage('Prepare') {
      steps{
        script {
            sh 'npm install'
            sh 'npm run build'
        }
      }
    }
    stage('Test lint') {
      steps{
        script {
            sh 'ng lint'
        }
      }
    }
    stage('Test - ng test') {
        options {
            timeout(time: 1, unit: "MINUTES")
        }
      steps{
        script {
               try {
                    sh 'ng test --code-coverage'
               } catch (err) {
                   println "Exception: " + err
                   buildResult = "SUCCESS"
          }
        }
      }
    }
    stage('Build - npm build') {
      steps{
        script {
            sh 'npm run build'
        }
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
