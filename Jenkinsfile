pipeline{
	agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('flaskdockerHub')
	}

	stages {
	    stage('verify tools') {
			steps {
				sh '''
                    docker info
                    docker version
                    docker-compose version
                '''
			}
		}
	    stage('gitclone') {
			steps {
				git url: "https://github.com/Gerardbulky/flask-jenkins.git", branch: "main"
			}
		}
		stage('Build') {
			steps {
				sh 'docker build -t bossmanjerry/soso_nodeapp:latest .'
			}
		}
		stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
		stage('Push') {
			steps {
				sh 'docker push bossmanjerry/soso_nodeapp:latest'
			}
		}
        stage("Deploy") {
            steps {
                echo "Deploying the container"
                sh "docker-compose down"
                sh "docker-compose pull" // Pull the latest images
                sh "docker-compose up -d" // Start the services in detached mode
            }
        }
	}
	post {
		always {
			sh 'docker logout'
		}
	}
}