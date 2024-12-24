pipeline {
    agent any

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['staging', 'production'], description: 'Choose the environment to deploy to')
        choice(name: 'CLIENT', choices: ['client1', 'client2'], description: 'Select the client')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = "us-west-1"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://repo-url/terraform.git' // Replace with your repository URL
            }
        }

        stage('Configure AWS CLI') {
            steps {
                sh '''
                aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                aws configure set default.region $AWS_DEFAULT_REGION
                '''
            }
        }

        stage('Initialize Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    sh '''
                    terraform init \
                        -backend-config="bucket=terraform-state-bucket" \
                        -backend-config="key=${params.ENVIRONMENT}/${params.CLIENT}/terraform.tfstate"
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    sh "terraform plan -var-file=${params.CLIENT}.tfvars -out=tfplan"
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    input 'Review and Approve Deployment'
                    sh "terraform apply tfplan"
                }
            }
        }


        stage('Configure Kubectl and Deploy Karpenter and Application Load Balancer Controller') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    script {
                        // Extract the AWS region from Terraform outputs
                        AWS_REGION = sh(script: "terraform output -raw aws_region", returnStdout: true).trim()
                        EKS_CLUSTER_NAME = sh(script: "terraform output eks_cluster_name", returnStdout: true).trim()
                        CLUSTER_ENDPOINT = sh(script: "terraform output -raw cluster_endpoint", returnStdout: true).trim()
                        sh "aws eks update-kubeconfig --name $EKS_CLUSTER_NAME --region $AWS_REGION"
                        
                        sh "helm repo add karpenter https://charts.karpenter.sh/ && helm repo update"
                        sh "helm install karpenter karpenter/karpenter --namespace karpenter --create-namespace --set serviceAccount.create=true --set serviceAccount.name=karpenter --set clusterName=$EKS_CLUSTER_NAME --set clusterEndpoint=$CLUSTER_ENDPOINT"
                        
                        sh "helm repo add eks https://aws.github.io/eks-charts && helm repo update"
                        sh "helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=$EKS_CLUSTER_NAME --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller --set image.repository=amazon/aws-alb-ingress-controller"
                    }
                }
            }
        }

        stage('Deploy Karpenter Custom Resources') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    // Assume karpenter.yaml is tailored per client and environment, adjust the path as needed
                    sh "kubectl apply -f karpenter/${params.CLIENT}-karpenter.yaml"
                }
            }
        }
    }

    post {
        cleanup {
            cleanWs()
        }
    }
}
