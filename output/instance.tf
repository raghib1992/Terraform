resource "aws_key_pair" "test" {
    key_name = "ssh_key"
    public_key = "${file(var.PUBLIC_KEY)}"
  
}
resource "aws_instance" "example" {
    ami = "${var.AMIS}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.test.key_name}"
    tags = {
        Name = "terraform"
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.example.private_ip}" > /tmp/pri_ip.txt
    }
}

output "public_ip" {
    value = "${aws_instance.example.public_ip}"
  
}