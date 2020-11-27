variable "PUBLIC_KEY" {
    default = "mykey.pub"  
}

variable "AWS_REGION" {}

variable "AMIS" {
    type = map(string)
    default = {
        eu-north-1 = "ami-0a3a4169ad7cb0d77"
        ap-south-1 = "ami-0a4a70bd98c6d6441"
        us-west-2 = "ami-07dd19a7900a1f049"
        us-east-1 = "ami-0885b1f6bd170450c"
    }
}

variable "INSTANCE" {
    default = "t2.micro"
}

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}