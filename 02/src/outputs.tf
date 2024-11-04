output "output" {
  value = [
    { web_instance_name = yandex_compute_instance.platform.name },
    { web_external_ip = yandex_compute_instance.platform.network_interface.0.nat_ip_address},
    { web_fdqn = yandex_compute_instance.platform.fqdn},
    { db_instance_name = yandex_compute_instance.platform-db.name },
    { db_external_ip = yandex_compute_instance.platform-db.network_interface.0.nat_ip_address},
    { db_fdqn = yandex_compute_instance.platform-db.fqdn},
  ]
}