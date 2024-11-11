/* resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
} */
/* resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
 */
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    ssh_key = var.metadata.vm.ssh-keys
  }
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = module.test-vpc.vpc_network_id
  subnet_zones   = [var.default_zone,var.default_zone]
  subnet_ids     = [module.test-vpc.vpc_subnet_id]
  instance_name  = "marketing"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "test-vm2" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = module.test-vpc.vpc_network_id
  subnet_zones   = [var.default_zone,var.default_zone]
  subnet_ids     = [module.test-vpc.vpc_subnet_id]
  instance_name  = "analytics"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = "analytics"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "test-vpc" {
  source = "./test-vpc"
  env_name = "test-vpc"
  vpc_name = var.vpc_name
  zone = var.default_zone
  cidr = var.default_cidr
}


resource "yandex_compute_instance" "vm" {
    allow_stopping_for_update = true
    description               = "TODO: description; {{terraform managed}}"
    folder_id                 = "b1g9e0n72sa8lujhtbln"
    gpu_cluster_id            = null
    
    labels                    = {
        "project" = "marketing"
    }
    maintenance_grace_period  = null
    metadata                  = {
        "serial-port-enable" = "1"
        "user-data"          = <<-EOT
            #cloud-config
            users:
              - name: ubuntu
                groups: sudo
                shell: /bin/bash
                sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                ssh_authorized_keys:
                  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQptbZSCfNJdnehfAcXMe2dubOcwN6FZZawaY3OL3dn user@DebVM1
            package_update: true
            package_upgrade: false
            packages:
              - nginx
        EOT
    }
    name                      = "develop-marketing-0"
    network_acceleration_type = "standard"
    platform_id               = "standard-v1"
    service_account_id        = null
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        device_name = "fhmjvsuqgbngth04ouo6"
        disk_id     = "fhmjvsuqgbngth04ouo6"
        mode        = "READ_WRITE"

        initialize_params {
            block_size  = 4096
            description = null
            image_id    = "fd8koalti6a8443fs9km"
            name        = null
            size        = 10
            snapshot_id = null
            type        = "network-hdd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 2
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        index              = 0
        ip_address         = "10.0.1.9"
        ipv4               = true
        ipv6               = false
        ipv6_address       = null
        nat                = true
        nat_ip_address     = "89.169.157.182"
        security_group_ids = []
        subnet_id          = "e9brccantabi6823ncjf"
    }

    placement_policy {
        host_affinity_rules       = []
        placement_group_id        = null
        placement_group_partition = 0
    }

    resources {
        core_fraction = 5
        cores         = 2
        gpus          = 0
        memory        = 1
    }

    scheduling_policy {
        preemptible = true
    }
}