resource "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = "${var.PUBLIC_KEY}"  
}

resource "aws_instance" "test_ebs" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "${var.INSTANCE}"
    # VPC subnet
    # subnet_id = "value"
    tenancy = "default"
    key_name = aws_key_pair.mykey.key_name
    # security group
    # vpc_security_group_ids = ""
    # user dat
    # user_data = ""
    tags = {
        Name = "test_ebs"
    }
}

resource "aws_ebs_volume" "volume-1" {
  availability_zone = "${var.AWS_REGION}"
  size              = 40
  type = "gp2"
  tags = {
    Name = "volume-1"
  }
}

resource "aws_volume_attachment" "vol_att" {
  device_name = "/dev/volume-1"
  volume_id   = aws_ebs_volume.volume-1.id
  instance_id = aws_instance.test_ebs.id
}