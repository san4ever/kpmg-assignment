resource "google_compute_firewall" "test-1" {
  name    = var.name
  network = var.network
 
  allow {
    protocol = "tcp"
    ports    = var.ports
  }

  source_tags = var.source_tags

}

