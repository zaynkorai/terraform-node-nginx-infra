resource "google_compute_instance" "backend_instance" {
  count        = 2
  name         = "backend-instance-${count.index}"
  machine_type = "f1-micro"

  // Create a new boot disk from an image (Lets use one created by Packer)
  boot_disk {
    initialize_params {
      image = data.google_compute_image.nodejs_image.self_link
    }
  }

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
