resource "local_file" "ansible_inventory_file" {
  content  = templatefile("/home/user/ter-homeworks/03/src/hosts.tpl",
    {
      web = yandex_compute_instance.platform,
      database = yandex_compute_instance.db_vm,
      storage = [yandex_compute_instance.storage]
    }
  )
  filename = "/home/user/ter-homeworks/03/src/ansible_inventory"
}

output "ansible_inventory" {
  value = local_file.ansible_inventory_file.content
}