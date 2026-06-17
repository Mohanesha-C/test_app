pipeline {

    agent any

    environment {

        IMAGE_NAME = "cmohanesha/test_app"
        IMAGE_TAG  = "${BUILD_NUMBER}"

    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm

            }
        }

        stage('Build') {

            steps {

                bat 'mvn clean package'

            }
        }

        stage('Docker Build') {

            steps {

                bat """
                docker build \
                -t ${IMAGE_NAME}:${IMAGE_TAG} .
                """
            }
        }

        stage('Docker Push') {

            steps {

                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {

                    bat """
                            echo "User: [$DOCKER_USER]"
                            echo "Password length: $(printf %s "$DOCKER_PASS" | wc -c)"
                        """

                    bat """
                    echo \$DOCKER_PASS | docker login \
                    -u \$DOCKER_USER \
                    --password-stdin

                    docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }

        stage('Deploy To Kubernetes') {

            steps {

                withCredentials([
                    file(
                        credentialsId: 'kubeconfig',
                        variable: 'KUBECONFIG_FILE'
                    )
                ]) {

                    bat """
                    export KUBECONFIG=\$KUBECONFIG_FILE

                    kubectl set image deployment/test_app \
                    test_app=${IMAGE_NAME}:${IMAGE_TAG}

                    kubectl rollout status deployment/test_app
                    """
                }
            }
        }
    }
}