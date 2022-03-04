project = "kpmg-gcp-training"
region  = "asia-southeast1"
mtu     = 1460
// auto_create_subnetworks = true

#VPC
vpc_name                = "kpmg-vpc"
ilp_name                = "l7-ilb-network"
auto_create_subnetworks = false

#proxy subnet
proxy_name    = "l7-ilb-proxy-subnet"
ip_cidr_range = "10.0.0.0/24"
proxy_region  = "asia-southeast1"
purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
role          = "ACTIVE"
// network       = google_compute_network.ilb_network.ip_cidr_range

#Backend subnet
subnet_name          = "l7-ilb-subnet"
subnet_ip_cidr_range = "10.0.1.0/24"
subnet_region        = "asia-southeast1"
// network       = google_compute_network.ilb_network.id

#MIG 
mig_name           = "l7-ilb-mig1"
mig_region         = "asia-southeast1"
instance_name      = "primary"
base_instance_name = "vm"
target_size        = 2

#Instance_template
mig_template_name = "l7-ilb-mig-template"
machine_type      = "e2-small"
tags              = ["zone-server"]
source_image      = "debian-cloud/debian-10"
auto_delete       = true
boot              = true

// #forwarding Rule
forwarding_rule_name   = "l7-ilb-forwarding-rule"
forwarding_rule_region = "asia-southeast1"
ip_protocol            = "TCP"
load_balancing_scheme  = "INTERNAL_MANAGED"
port_range             = "80"
// depends_on            = [google_compute_subnetwork.proxy_subnet]
network_tier = "PREMIUM"

# http proxy
http_name   = "l7-ilb-target-http-proxy"
http_region = "asia-southeast1"

#url map 
url_name   = "l7-ilb-regional-url-map"
url_region = "asia-southeast1"

#backend service
backend_name                  = "l7-ilb-backend-subnet"
backend_region                = "asia-southeast1"
protocol                      = "HTTP"
load_balancing_scheme_backend = "INTERNAL_MANAGED"
timeout_sec                   = 10
// health_checks         = [google_compute_region_health_check.default.id]
balancing_mode  = "UTILIZATION"
capacity_scaler = 1.0

#health check
health_name        = "l7-ilb-hc"
health_region      = "asia-southeast1"
port_specification = "USE_SERVING_PORT"

# allow http from proxy subnet to backends
allow_name         = "l7-ilb-fw-allow-ilb-to-backends"
direction          = "INGRESS"
source_ranges      = ["10.0.0.0/24"]
target_tags_server = ["zone-server"]
backend_protocol   = "tcp"
backend_ports      = ["80", "443"]

#test instance
test_name         = "l7-ilb-test-vm"
zone              = "asia-southeast1-b"
machine_type_test = "n1-standard-1"


name    = "test-firewall"
network = "vpc-network"

ports       = ["80"]
source_tags = ["zone-server"]



