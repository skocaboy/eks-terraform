terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "staging/${var.client_id}/terraform.tfstate"
    region         = var.region
  }
}
