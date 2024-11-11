###cloud vars
/* ariable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
} */

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
  description = "VPC network&subnet name"
}

###data vars
variable "ubuntu_family_var" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Some var"
}

variable "db_vm" {
  type = list(object({
    vm_name = string
    cores   = number
    memory  = number
    disk_volume = number
#    platform    = string
  }))
  default = [
    {
      vm_name       = "main"
      cores         = 2
      memory        = 4
      disk_volume   = 20
#      platform      = "standard-v1"

    },
    {
      vm_name       = "replica"
      cores         = 4
      memory        = 8
      disk_volume   = 25
#      platform      = "standard-v1"

    }
  ]

}


variable "vm_resource" {
  type = list(object({
    public_ip   = bool
    platform    = string
    preemptible = bool
  }))
  default = [
    {
      public_ip   = true
      platform    = "standard-v1"
      preemptible = true

    }
  ]
}