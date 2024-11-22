pipeline {
    agent any  // This will use a Windows agent if available

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning the repository using git...'
                // Use the git step to clone the repository
                git url: 'https://github.com/SairamPabbisetty/quizApp.git'
            }
        }

        stage('Build WAR') {
            steps {
                echo 'Building the WAR file...'
                // Use Windows batch commands to create the WAR file
                bat '''
                echo Cleaning up target directory
                rmdir /s /q target
                mkdir target
                echo Creating WAR file
                jar -cvf target/quizApp.war *
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying WAR file to Tomcat...'
                // Check if the WAR file exists before deploying
                bat '''
                if exist target/quizApp.war (
                    echo WAR file exists, deploying to Tomcat...
                    curl --user admin:admin ^
                         --upload-file target/quizApp.war ^
                         "http://localhost:8090/manager/text/deploy?path=/quizApp&update=true"
                ) else (
                    echo WAR file not found, please check the build stage.
                    exit 1
                )
                '''
            }
        }
    }
}
