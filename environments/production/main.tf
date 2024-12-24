provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }
}

module "alb" {
  source             = "../../modules/alb"
  alb_name           = "production-alb"
  subnet_ids         = ["subnet-111111", "subnet-222222", "subnet-333333"]
  security_group_id  = "sg-bbbbbbb"
  environment        = "production"
}

module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "production-eks-cluster"
  cluster_role_arn = "arn:aws:iam::123456789012:role/EKS_ClusterRole_production"
  node_group_name  = "production-node-group"
  node_role_arn    = "arn:aws:iam::123456789012:role/EKS_NodeRole_production"
  subnet_ids       = var.subnet_ids
  node_desired_size = 2
  node_max_size     = 3
  node_min_size     = 1
  region           = var.region
}

module "vpc" {
  source = "../../modules/vpc"

  cidr_block         = "10.0.0.0/16"
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  environment        = "production"
}

module "elasticache" {
  source         = "../../modules/elasticache"
  subnet_ids     = [module.vpc.private_subnet_ids[0]]  // Assuming using the first private subnet
  environment    = "production"
  node_type      = "cache.t2.micro"  // Example node type
  num_cache_nodes = 1
}

module "monitoring" {
  source      = "../../modules/monitoring"
  environment = "production"
}

module "cloudwatch" {
  source          = "../../modules/cloudwatch"
  rds_identifier  = "production-rds-mysql"
  environment     = "production"
  alarm_actions   = ["arn:aws:sns:us-west-2:123456789012:alert-topic"]
}

module "rds" {
  environment       = var.environment
  source            = "../../modules/rds"
  instance_class    = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage
  engine_version    = var.rds_engine_version
  username          = var.rds_username
  password          = var.rds_password
  subnet_ids        = var.rds_subnet_ids
  security_group_ids= var.rds_security_group_ids
  multi_az          = var.rds_multi_az
  delete_automation_retention_period = var.rds_delete_automation_retention_period
}


module "opensearch" {
  source                = "../../modules/opensearch"
  environment           = "production"
  elasticsearch_version = "7.10"
  instance_type         = "t2.small.elasticsearch"
  instance_count        = 2
  dedicated_master_enabled = true
  dedicated_master_type = "t2.small.elasticsearch"
  dedicated_master_count = 3
  ebs_enabled           = true
  volume_size           = 10
  subnet_ids            = ["subnet-xxxx", "subnet-yyyy"]
  security_group_ids    = ["sg-xxxx"]
  snapshot_start_hour   = 3
}

module "s3" {
  source      = "../../modules/s3"
  environment = "production"
}