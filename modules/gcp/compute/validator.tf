resource "google_compute_address" "validator" {
  name   = "${var.project}-${var.env}-validator"
  region = var.validator_region
}

resource "google_compute_instance" "validator" {
  name           = "${var.project}-${var.env}-validator"
  machine_type   = var.validator_machine_type
  zone           = var.validator_zone
  can_ip_forward = true
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.validator_image
      size = var.validator_disk_size
      labels = {
        env     = var.env
        project = var.project
      }
    }
  }
  tags = var.validator_tags

  network_interface {
    network    = var.validator_network
    subnetwork = var.validator_subnetwork

    access_config {
      // Ephemeral public IP
      nat_ip = google_compute_address.validator.address
    }
  }
  
  metadata = {
    ssh-keys = var.validator_ssh_keys
  }
}
