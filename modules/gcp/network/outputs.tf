output "vpc_id" {
  value = google_compute_network.main.id
}

output "vpc_name" {
  value = google_compute_network.main.name
}

output "subnet_workloads_ids" {
  value = {
    for subnet in google_compute_subnetwork.subnets :
      subnet.region => subnet.id
  }
}
