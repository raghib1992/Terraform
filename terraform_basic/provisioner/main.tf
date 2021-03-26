resource "aws_key_pair" "test-key" {
    key_name = "test-key"
    public_key = "${file(var.PUBLIC_KEY)}"
}


resource "aws_instance" "terraform_test" {
    ami = "ami-0d758c1134823146a "
    instance_type = "t2.micro"
    key_name = aws_key_pair.test-key.key_name


    provisioner "file" {
        source = "script.sh"
        destination =  "/home/ubuntu/script.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo chmod +x /home/ubuntu/script.sh",
            "sudo /home/ubuntu/script.sh"
        ]
    }

    connection {
        user = var.USERNAME
        private_key = "${file(var.PRIVATE_KEY)}"
        host = coalesce(self.public_ip, self.private_ip)
    }

}

