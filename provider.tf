#
# Terraform version
terraform {
  required_version = ">= 0.12"
}

#
# Credentials
provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}

