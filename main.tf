data "google_compute_image" "nodejs_image" {
  family  = "golden-nodejs"
  project = var.project
}

resource "google_compute_firewall" "default" {
  name    = "tf-www-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","443","22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}
