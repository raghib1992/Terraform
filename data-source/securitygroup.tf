data "aws_ip_ranges" "ip_range" {
  regions  = ["us-west-2", "ap-south-1"]
  services = ["ec2"]
}

resource "aws_security_group" "secure_world" {
  name = "secure_duniya"
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = "${slice(data.aws_ip_ranges.ip_range.cidr_blocks, 0, 50)}"
  }
  tags = {
    CreateDate = "${data.aws_ip_ranges.ip_range.create_date}"
    SyncToken  = "${data.aws_ip_ranges.ip_range.sync_token}"
  }
}