resource "google_compute_firewall" "ssh" {
  name    = "vpn-firewall"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["local-ssh"]
  source_ranges = var.ssh_whitelisted_ips
}

resource "google_compute_firewall" "validator" {
  name    = "validator-firewall"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["26656", "26657", "1317"]
  }

  target_tags   = ["validator"]
  source_ranges = ["0.0.0.0/0"]
}
