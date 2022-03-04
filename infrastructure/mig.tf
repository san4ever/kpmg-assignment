# MIG
resource "google_compute_region_instance_group_manager" "mig" {
  name     = var.mig_name
  provider = google-beta
  region   = var.mig_region
  version {
    instance_template = google_compute_instance_template.instance_template.id
    name              = var.instance_name
  }
  base_instance_name = var.base_instance_name
  target_size        = var.target_size
}
