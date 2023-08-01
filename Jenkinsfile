pipeline{
	agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('flaskdockerHub')
	}

	stages {
	    
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
                sh "docker-compose down && docker-compose up -d"
			}
		}
	}
	post {
		always {
			sh 'docker logout'
		}
	}
}