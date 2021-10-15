terraform {
  backend "gcs" {
    bucket  = "tf-states-boavista"
    prefix  = "state/boa_vista/gcp"
  }
}
