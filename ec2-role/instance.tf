resource "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = "${filename(var.PUBLIC_KEY)}"  
}

resource "aws_instance" "example" {
    ami = "ami-0a4a70bd98c6d6441"
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey.name
    iam_instance_profile = aws_iam_instance_profile.s3-access-instance-profile.name  
}