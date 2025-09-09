pipeline {
    agent any

    stages {
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('git checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Pranav1194/animaation-loginpage.git']])
            }
        }
        stage('docker image build') {
            steps {
                sh "ls"
                sh "docker build -t sawarkar/repoanimation:latest ."
            }
        }
        stage('docker login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'hellodocker', passwordVariable: 'passis', usernameVariable: 'usrname')]) {
                    script {
                        // Perform Docker login using the credentials
                        sh "docker login -u $usrname -p $passis"
                    }
                }
            }
        }
        stage('docker push') {
            steps {
                sh "docker push sawarkar/repoanimation:latest"
            }
        }
        stage('deploy to k8s'){
            steps{
               withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8ssec', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                sh "kubectl apply -f deployment.yml"
                sh "kubectl apply -f service.yml"
                 }
                    
                      
                
            }
        }
    }
}
