terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  version = "3.5.0"
  project = "eminent-goods-276115"
  region  = "us-central1"
  zone    = "us-central1-a"
}