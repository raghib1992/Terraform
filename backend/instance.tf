resource "aws_instance" "example" {
    ami = "${var.AMIS}"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform"
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
    }
}

output "public_ip" {
    value = "${aws_instance.example.public_ip}"  
}