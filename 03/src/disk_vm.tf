
resource "yandex_compute_disk" "disk" {
  count       = 3
  name        = "disk-${count.index + 1}"
  size        = 1
#  zone        = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name         = var.storage_name
  platform_id  = var.storage_platform
  zone         = var.default_zone
  folder_id    = var.folder_id

  resources {
    cores         = var.db_vm[1].cores
    memory        = var.db_vm[1].memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk
    content {
      disk_id = secondary_disk.value.id
      mode    = var.storage_disk_mode
    }
  }
}
