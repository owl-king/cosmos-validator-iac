variable "project" {}
variable "env" {}


variable "validator_network" {
  description = "VPC network (name or link) to deploy validator"
}

variable "validator_region" {
  description = "GCP region to deploy validator and its IP"
}

variable "validator_image" {
  description = "validator base image. Perfer Ubuntu 22.04"
}

variable "validator_machine_type" {
  description = "validator machine type"
}

variable "validator_subnetwork" {
  description = "validator subnetwork to deploy"
}

variable "validator_zone" {
  description = "validator's zone to deploy"
}

variable "validator_tags" {
  description = "validator netowrks tags"
}

variable "validator_ssh_keys" {
    description = "Default ssh keys to validator node"
}

variable "validator_disk_size" {
    description = "Validator boot disk size"
}
