


resource "yandex_compute_instance" "platform" {
  name        = "web-${ count.index+1 }"
  count = 2
  resources {
    cores         = var.db_vm[count.index+1].cores
    memory        = var.db_vm[count.index+1].memory
    core_fraction = var.db_vm[count.index+1].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.example.id}"]
  }

  metadata = {
    ssh-keys = local.ssh_public_key
  }

}