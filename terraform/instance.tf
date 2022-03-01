resource "google_compute_instance" "mygcp" {
  name = var.host_names[count.index]
  machine_type = "e2-standard-4"
  zone = "us-central1-a"
  count = 2

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = 100
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<EOF
  #!/bin/bash
  cd /var/tmp/
  wget https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_master.sh
  wget https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_worker.sh
  wget https://raw.githubusercontent.com/sanjeevrana-hp/Kubernets/master/calico.yaml
  chmod 700 install_master.sh
  chmod 700 install_worker.sh
  EOF

  metadata = {
    ssh-keys = "rana:${file("id_rsa.pub")}"
  }
}



