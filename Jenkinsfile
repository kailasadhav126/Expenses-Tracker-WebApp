pipeline{
    agent {label "myagent"}
    stages{
        stage("code"){
            steps{
                git url: "https://github.com/kailasadhav126/Expenses-Tracker-WebApp.git", branch:"main"
            }
        }
        stage("Build"){
            steps{
                sh "docker build -t expensetracker:latest ."
            }
        }
        stage("Test"){
            steps{
                echo "Devloper / tester test"
            }
        }
        stage("push to docker hub"){
            steps{
                 withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]){
                 sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                 sh "docker tag expensetracker $DOCKER_USER/expensetracker"
                 sh "docker push $DOCKER_USER/expensetracker:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                sh "docker compose  up -d --build " 
            }
        }
        
    }
}
