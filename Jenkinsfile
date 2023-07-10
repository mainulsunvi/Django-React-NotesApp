pipeline {
	agent any

	stages {
		stage("Clone Code") {
			steps {
			echo "Cloning the code ..."
			git url:"https://github.com/mainulsunvi/Django-React-NotesApp.git", branch: "main"
			}
		}

		stage("Build") {
			steps {
			echo "building the Image ..."
			sh "docker build -t my-note-app ."
			}
		}

		stage("Push to Docker Hub") {
			steps {
				echo "Pushing the Image to Docker Hub ..."
				withCredentials([usernamePassword(credentialsId:"dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]){
				 sh "docker tag my-note-app ${env.dockerHubUser}/my-note-app:latest"
				 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
				 sh "docker push  ${env.dockerHubUser}/my-note-app:latest"
				}
			}
		}

		stage("Deploy") {
			steps {
				echo "Deploying the Container ..."
				sh '''
				containers=$(docker ps -q)
        if [ ! -z $containers ]; 
        then
        docker kill $containers;
        fi
        docker run -d -p 8000:8000  msunvi/my-note-app:latest
        '''
			}
		}
	}
}
