#Criação do cluster
resource "google_container_cluster" "bv_container_cluster" {
  name     = "${var.name}"
  location = "${var.location}"
  project     = "${var.project}"
  description = "GKE Cluster do Boa Vista"
  remove_default_node_pool = true
  initial_node_count       = "${var.initial_node_count}"
}

#Gerenciamento dos nodes
resource "google_container_node_pool" "bv_nodes_cluster" {
  name       = "${var.name}"
  project     = "${var.project}"
  location   = "${var.location}"
  cluster    = google_container_cluster.bv_container_cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/logging.write"      
    ]
  }
}