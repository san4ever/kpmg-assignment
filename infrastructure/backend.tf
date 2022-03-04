terraform {
  backend "gcs" {
    bucket = "kpmg"
    prefix = "terraform/state"
  }
}

