pipeline {
    agent { label "dev" }
    
    stages {
        
        stage("Code"){
            
            steps{
                git url: "https://github.com/anushkatomar76/node-js.git", branch: "main"
                echo "code clone"
            }
            
        }
        
        stage("Build and Test"){
            
            steps{
                sh "docker build -t node-app ."
                echo "build done"
            }
            
        }
        
        stage("Push to DockerHub"){
            
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker tag node-app:latest ${env.dockerHubUser}/node-app:latest"
                sh "docker push ${env.dockerHubUser}/node-app:latest"
                echo "pushed"
                }
            }
            
        }
        
        stage("Deploy"){
            
            steps{
                sh "docker compose down && docker compose up -d"
                echo "deploy"
            }
        }
        
    }
}
