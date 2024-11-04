
###vpc vars
variable "vm_db_name" {
  type = string
  default = "netology-develop-platform-db"
}

variable "vm_db_latform_id" {
  type = string
  default = "standard-v1"
}

variable "vm_db_zone" {
  type = string
  default = "ru-central1-b"
}

variable "subnet2_name" {
  type        = string
  default     = "dev-subnet2"
  description = "VPC network & subnet name"
}

variable "subnet2_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "env1" {
  type    = string
  default = "develop"
}

variable "project1" {
  type    = string
  default = "platform"
}

variable "role1" {
  type    = string
  default = "db"
}


variable "vm_db_resource" {
  type = list(object({
    #instance_name = string
    #instance_cores         = number
    #instance_memory        = number
    #instance_core_fraction = number
    public_ip   = bool
    platform    = string
    preemptible = bool
  }))
  default = [
    {
      #instance_name = "netology-develop-platform-db"
      #instance_cores         = 2
      #instance_memory        = 2
      #instance_core_fraction = 20
      public_ip   = true
      platform    = "standard-v1"
      preemptible = true

    }
  ]
}


