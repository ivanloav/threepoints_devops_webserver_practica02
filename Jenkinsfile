@Library('threepoints-sharedlib') _
pipeline {
    agent any
    
    environment {
        SONARQUBE_ENV = 'Sonar Local'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Descargando el código desde GitHub...'
                git branch: 'master', url: 'https://github.com/ivanloav/threepoints_devops_webserver_practica02.git'
            }
        }

        stage('Parallel Steps') {
            parallel {
                stage('Pruebas de SAST') {
                    steps {
                        sonarAnalysis(abortPipeline: true, qualityGateCheck: true)
                    }
                }

                stage('Imprimir Env') {
                    steps {
                        echo "El workspace es: ${env.WORKSPACE}"
                    }
                }
            }
        }

        stage('Configurar archivo') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'Credentials_Threepoints', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh """
                            echo '[credentials]' > credentials.ini
                            echo 'user=${USER}' >> credentials.ini
                            echo 'password=${PASS}' >> credentials.ini
                        """
                    }
                }
                archiveArtifacts artifacts: 'credentials.ini'
            }
        }

        stage('Build') {
            steps {
                echo 'Construyendo el contenedor Docker...'
                sh 'docker build -t devops_ws .'
            }
        }
    }

    post {
        success {
            echo 'Pipeline ejecutado exitosamente.'
        }
        failure {
            echo 'Hubo un fallo en el pipeline.'
        }
    }
}
