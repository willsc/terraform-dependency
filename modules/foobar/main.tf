
resource "google_compute_instance" "default" {
  name = var.name
  machine_type = "n1-standard-1"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }


network_interface {
   network = "default"
   access_config {

       }
   }



metadata_startup_script = "sudo apt-get update && sudo  apt-get instal apache2 -y && echo '<!doctype html><html><body><h1>Avenue Code is the leading software consulting agency focused on delivering end-to-end development solutions for digital transformation across every vertical. We pride ourselves on our technical acumen, our collaborative problem-solving ability, and the warm professionalism of our teams.!</h1></body></html>' | sudo tee /var/www/html/index.html"

// Apply the firewall rule to allow external IPs to access this instance
tags = ["http-server"]

  depends_on = [var.depends_list]
}

output "depend_on" {
  value = [google_compute_instance.default.id]
}


output "ip" {
value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}


