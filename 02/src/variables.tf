###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1ge8ac59kbr0jvvl38e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g9e0n72sa8lujhtbln"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###data vars
variable "ubuntu_family_var" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Some var"
}

###vpc vars
variable "vm_web_name" {
  type = string
  default = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
}

variable "env" {
  type    = string
  default = "develop"
}

variable "project" {
  type    = string
  default = "platform"
}

variable "role" {
  type    = string
  default = "web"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    "web" = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    "db" = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys           =  string
  }))  
  default = {
    "vm" = {
      serial-port-enable = 1
      ssh-keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQptbZSCfNJdnehfAcXMe2dubOcwN6FZZawaY3OL3dn user@DebVM1"
    }  
  }
  description = "metadata"
}

###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQptbZSCfNJdnehfAcXMe2dubOcwN6FZZawaY3OL3dn user@DebVM1"
#  description = "ssh-keygen -t ed25519"
#}
