variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "auto_create_subnetworks" {
  type = bool
}
// variable "depends_on" {
//     type = list
// }

variable "mtu" {
  type = number
}


variable "vpc_name" {
  type = string
}
variable "ilp_name" {
  type = string
}

variable "proxy_name" {
  type = string
}

variable "ip_cidr_range" {
  type = string
}
variable "purpose" {
  type = string
}
variable "role" {
  type = string
}

variable "subnet_name" {
  type = string
}
variable "subnet_ip_cidr_range" {
  type = string
}

variable "proxy_region" {
  type = string
}
variable "subnet_region" {
  type = string
}

variable "mig_name" {
  type = string
}
variable "mig_region" {
  type = string
}
variable "instance_name" {
  type = string
}
variable "base_instance_name" {
  type = string
}
variable "target_size" {
  type = number
}
variable "mig_template_name" {
  type = string
}
variable "machine_type" {
  type = string
}
variable "tags" {
  type = list(string)
}
variable "source_image" {
  type = string
}
variable "auto_delete" {
  type = bool
}
variable "boot" {
  type = bool
}
variable "forwarding_rule_name" {
  type = string
}
variable "forwarding_rule_region" {
  type = string
}

variable "ip_protocol" {
  type = string
}
variable "load_balancing_scheme" {
  type = string
}
variable "port_range" {
  type = string
}
variable "network_tier" {
  type = string
}
variable "http_name" {
  type = string
}
variable "http_region" {
  type = string
}
variable "url_name" {
  type = string
}
variable "url_region" {
  type = string
}
#backend
variable "backend_name" {
  type = string
}
variable "backend_region" {
  type = string
}
variable "protocol" {
  type = string
}
variable "load_balancing_scheme_backend" {
  type = string
}
variable "timeout_sec" {
  type = number
}
variable "balancing_mode" {
  type = string
}
variable "capacity_scaler" {
  type = number
}

#health_check
variable "health_name" {
  type = string
}
variable "health_region" {
  type = string
}
variable "port_specification" {
  type = string
}

#allow http to backend 
variable "allow_name" {
  type = string
}
variable "direction" {
  type = string
}
variable "source_ranges" {
  type = list(string)
}
variable "target_tags_server" {
  type = list(string)
}
variable "backend_protocol" {
  type = string
}
variable "backend_ports" {
  type = list(string)
}


#test instance 
variable "test_name" {
  type = string
}
variable "zone" {
  type = string
}
variable "machine_type_test" {
  type = string
}
variable "instance-group" {
  type = string
}
