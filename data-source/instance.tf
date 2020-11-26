resource "aws_instance" "test" {
    ami = "${var.AMIS}"
    instance_type = "t2.micro"  
}