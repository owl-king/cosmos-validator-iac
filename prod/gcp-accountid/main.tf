module "network" {
  source                        = "../../modules/gcp/network"
  env                           = "prod"
  project                       = "YOURPROJECT"
  ssh_whitelisted_ips           = ["x.x.x.x/32"] # Your ip
}


module "validator-test-us-central1" {
  source                               = "../../modules/gcp/compute"
  env                                  = "prod"
  project                              = "YOURPROJECT"
  validator_network                    = module.network.vpc_name
  validator_region                     = "us-central1"
  validator_subnetwork                 = module.network.subnet_workloads_ids["us-central1"]
  validator_machine_type               = "e2-standard-8"
  validator_image                      = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230302"
  validator_zone                       = "us-central1-a"
  validator_tags                       = ["local-ssh", "validator"]
  validator_ssh_keys                   = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  validator_disk_size                  = "300"
}
