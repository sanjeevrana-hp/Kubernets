terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.65.0"
    }
  }
}

provider "google" {
  project     = "diamanti-314308"
  credentials = "${file("credentials.json")}"
  region      = "us-central1"
}
