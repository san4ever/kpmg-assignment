# instance template
resource "google_compute_instance_template" "instance_template" {
  name         = var.mig_template_name
  provider     = google-beta
  machine_type = var.machine_type
  tags         = var.tags

  network_interface {
    network    = google_compute_network.ilb_network.id
    subnetwork = google_compute_subnetwork.ilb_subnet.id
    access_config {
      # add external ip to fetch packages
    }
  }
  disk {
    source_image = var.source_image
    auto_delete  = var.auto_delete
    boot         = var.boot
  }

}
