resource "aws_key_pair" "insert_key" {
    key_name = "remote_key"
    public_key = "${file(var.PUBLIC_KEY)}"  
}