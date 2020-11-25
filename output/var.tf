variable "AWS_REGION" {}

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AMIS" {
  default = "ami-07dd19a7900a1f049"
}

variable "PUBLIC_KEY" {
    default = "ssh_key.pub"  
}

variable "PRIVATE_KEY" {
    default = "ssh_key"
}