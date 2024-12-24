terraform {
  backend "s3" {
    bucket = "terraform-state-bucket"
    key    = "production/${var.client_id}/terraform.tfstate"
    region = var.region
  }
}
