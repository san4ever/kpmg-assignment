# VPC
resource "google_compute_network" "ilb_network" {
  name                    = var.ilp_name
  provider                = google-beta
  auto_create_subnetworks = var.auto_create_subnetworks
}

# proxy-only subnet
resource "google_compute_subnetwork" "proxy_subnet" {
  name          = var.ilp_name
  provider      = google-beta
  ip_cidr_range = var.ip_cidr_range
  region        = var.proxy_region
  purpose       = var.purpose
  role          = var.role
  network       = google_compute_network.ilb_network.id
}

# backed subnet
resource "google_compute_subnetwork" "ilb_subnet" {
  name          = var.subnet_name
  provider      = google-beta
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.subnet_region
  network       = google_compute_network.ilb_network.id
}
