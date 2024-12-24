# FastTrack-Terraform Project

This repository contains the infrastructure as code using Terraform for provisioning AWS resources, configuring Karpenter for autoscaling, and setting up AWS Load Balancer Controller in an EKS cluster.

## Overview

The FastTrack-Terraform project is structured to support multiple clients across two main environments: staging and production. Each environment is capable of handling specific configurations for each client, ensuring isolation and customization as required.

## Directory Structure
- **/environments**: Contains separate directories for each deployment environment, such as production and staging, allowing for isolated management and deployment.
  - **production**: Production environment configurations.
    - **karpenter**: Includes YAML configurations for Karpenter auto-scaling.
      - **client1-karpenter.yaml**
      - **client2-karpenter.yaml**
    - **backend.tf**: Configuration for the Terraform backend.
    - **client1.tfvars, client2.tfvars**: Variable files for different client configurations.
    - **main.tf**: Main Terraform configuration file.
    - **outputs.tf**: Output definitions for Terraform resources.
    - **variables.tf**: Variable definitions for Terraform configurations.
  - **staging**: Staging environment configurations, structured similarly to production.
- **/modules**: Reusable Terraform modules for different AWS services.
  - **alb**: Module for AWS Application Load Balancer.
  - **cloudwatch**: Module for monitoring with AWS CloudWatch.
  - **eks**: Module for Amazon Elastic Kubernetes Service setups.
  - **elasticache**: Module for provisioning AWS ElastiCache instances.
  - **monitoring**: General infrastructure monitoring configurations.
  - **opensearch**: Module for deploying AWS OpenSearch.
  - **rds**: Module for managing AWS RDS instances.
  - **s3**: Module for handling Amazon S3 storage.
  - **vpc**: Module for setting up AWS Virtual Private Cloud environments.


## Usage

### Configurations

1. **AWS Credentials**: Ensure your AWS credentials are configured in Jenkins to allow access for provisioning and managing resources.
2. **Environment and Client Selection**: When running the Jenkins pipeline, select the appropriate environment (staging or production) and the client to deploy configurations for.
3. **Terraform Operations**: The pipeline handles Terraform initialization, planning, and application. Review the plan in the Jenkins pipeline before applying.
4. **Karpenter and ALB Deployment**: After Terraform setup, the pipeline configures Karpenter and AWS Load Balancer Controller using Helm.

### Deployment Steps

1. **Checkout**: Pull the latest code from the main branch.
2. **Terraform Init and Plan**: Initialize the backend and create an execution plan.
3. **Review and Apply**: Manually approve the plan before it is applied to ensure accuracy.
4. **Kubernetes Setup**: Post Terraform application, Karpenter and the AWS Load Balancer Controller are set up in the EKS cluster.
5. **Custom Resource Deployment**: Apply Karpenter-specific configurations using Kubernetes manifests.

# Environment Configuration Guide

This document provides a detailed overview of the structure and configuration files located under the `environments/<environment>/` directory within our Terraform project.

## Directory Structure Overview

Each environment (such as staging and production) has its own dedicated directory. This setup ensures that configurations are isolated per environment, allowing for safe and specific management of resources across different deployment stages.

### Common Files Description

- **`backend.tf`**: Configures the Terraform backend. This is essential for state management and facilitates team collaboration by storing state files securely.

- **`client1.tfvars, client2.tfvars`**: These files contain environment-specific variables for each client, allowing customization of resources per client.

- **`main.tf`**: Contains the core Terraform configuration for the environment, such as resource definitions and module calls.

- **`outputs.tf`**: Defines outputs from Terraform that are useful for other systems or for visibility post-execution.

- **`outputs.tf`**: Declares input variables used within the environment configuration

### Special Directories

- **`karpenter/`**: Contains Kubernetes YAML files for deploying Karpenter custom resources specific to each client and environment.
