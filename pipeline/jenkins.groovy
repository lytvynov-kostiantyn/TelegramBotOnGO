pipeline {
    agent any

    environment {
        REPO = 'https://github.com/lytvynov-kostiantyn/telegram_bot_on_go'
        BRANCH = 'main'
    }

    stages {

        stage('clone') {
            steps {
                echo 'Clone Repository'
                git branch: "${BRANCH}", url: "${REPO}"
            }
        }

        stage('format') {
            steps {
                echo 'Formating started'
                sh "make format"
            }
        }
    }
}