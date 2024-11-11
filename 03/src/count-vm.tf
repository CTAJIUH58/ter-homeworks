


resource "yandex_compute_instance" "platform" {
  name        = "web-${ count.index+1 }"
  count = 2
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
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