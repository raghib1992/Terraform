resource "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = "${file(var.PUBLIC_KEY)}"
}


resource "aws_instance" "terraform_test" {
    ami = ""
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey.key_name


    provisioner "file" {
        source = script.sh
        destination = /home/ubuntu/script.sh
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
    }

}

