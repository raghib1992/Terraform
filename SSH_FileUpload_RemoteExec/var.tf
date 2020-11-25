variable "AWS_REGION" {}

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AMIS" {
    type = map(string)
    default = {
        us-west-2 = "ami-07dd19a7900a1f049"
        ap-south-1 = "ami-0a9d27a9f4f5c0efc"
    }  
}

variable "USER" {
  type = map(string)
  default = {
      us-west-2 = "ubuntu"
      ap-south-1 = "ec2-user"
  }
}

variable "PUBLIC_KEY" {
    default = "ssh_key.pub"  
}

variable "PRIVATE_KEY" {
    default = "ssh_key"
  
}