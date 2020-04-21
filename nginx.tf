resource "google_compute_instance" "nginx_instance" {
  name         = "nginx-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  
  metadata_startup_script = "sudo apt-get update && sudo apt-get install -yq build-essential nginx"

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  metadata = {
    ssh-keys = "fetchsky:${file(var.public_key)}"
  }

}
