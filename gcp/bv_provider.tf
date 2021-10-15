#Utilização do provider do GCP
provider "google" {
  credentials = "${var.credentials}"
  project     = "${var.project}"
  region      = "${var.region}"
  zone        = "us-central1-c"
}
