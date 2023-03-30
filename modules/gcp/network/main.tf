resource "google_compute_network" "main" {
  name                    = "${var.project}-${var.env}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  count         = length(var.subnets)
  name          = "${var.project}-${var.env}-${var.subnets[count.index].name}"
  ip_cidr_range = var.subnets[count.index].ip_cidr_range
  region        = var.subnets[count.index].region
  network       = google_compute_network.main.id
}
