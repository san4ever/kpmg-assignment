terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.81.0"
    }
  }
}
provider "google" {
  project = var.project
  region  = var.region

}
