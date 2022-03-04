
# forwarding rule
resource "google_compute_forwarding_rule" "google_compute_forwarding_rule" {
  name                  = var.forwarding_rule_name
  provider              = google-beta
  region                = var.forwarding_rule_region
  depends_on            = [google_compute_subnetwork.proxy_subnet]
  ip_protocol           = var.ip_protocol
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.port_range
  target                = google_compute_region_target_http_proxy.default.id
  network               = google_compute_network.ilb_network.id
  subnetwork            = google_compute_subnetwork.ilb_subnet.id
  network_tier          = var.network_tier
}

# http proxy
resource "google_compute_region_target_http_proxy" "default" {
  name     = var.proxy_name
  provider = google-beta
  region   = var.proxy_region
  url_map  = google_compute_region_url_map.default.id
}

# url map
resource "google_compute_region_url_map" "default" {
  name            = var.url_name
  provider        = google-beta
  region          = var.url_region
  default_service = google_compute_region_backend_service.default.id
}

# backend service
resource "google_compute_region_backend_service" "default" {
  name                  = var.backend_name
  provider              = google-beta
  region                = var.backend_region
  protocol              = var.protocol
  load_balancing_scheme = var.load_balancing_scheme
  timeout_sec           = var.timeout_sec
  health_checks         = [google_compute_region_health_check.default.id]
  backend {
    group           = google_compute_region_instance_group_manager.mig.instance_group
    balancing_mode  = var.balancing_mode
    capacity_scaler = var.capacity_scaler
  }
}



# health check
resource "google_compute_region_health_check" "default" {
  name     = var.health_name
  provider = google-beta
  region   = var.health_region
  http_health_check {
    port_specification = var.port_specification
  }
}



# allow http from proxy subnet to backends
resource "google_compute_firewall" "fw-ilb-to-backends" {
  name          = var.allow_name
  provider      = google-beta
  direction     = var.direction
  network       = google_compute_network.ilb_network.id
  source_ranges = var.source_ranges
  target_tags   = var.target_tags_server
  allow {
    protocol = var.backend_protocol
    ports    = var.backend_ports
  }
}

# test instance
resource "google_compute_instance" "vm-test" {
  name         = var.test_name
  provider     = google-beta
  zone         = var.zone
  machine_type = var.machine_type_test
  network_interface {
    network    = google_compute_network.ilb_network.id
    subnetwork = google_compute_subnetwork.ilb_subnet.id
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
}

