variable "project" {
    description = "Project name"
}

variable "env" {
    description = "Current environment name"
}

variable "subnets" {
    description = "List of subnets in the vpc"
    default = [
        {
          name          = "subnet-us-central1"
          region        = "us-central1"
          ip_cidr_range = "10.0.1.0/24"
        },
        {
          name          = "subnet-us-east1"
          region        = "us-east1"
          ip_cidr_range = "10.0.2.0/24"
        },
        {
          name          = "subnet-europe-west1"
          region        = "europe-west1"
          ip_cidr_range = "10.0.3.0/24"
        },
    ]
}
variable "ssh_whitelisted_ips" {
    description = "Whitelisted ips for ssh connection"
    type = list
}
