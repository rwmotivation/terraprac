
provider "aws" {
	region = "ap-south-1"
}

resource "aws_security_group" "apsgtf" {
	name = "apsg-terraform"

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port        = 0
		to_port          = 0
		protocol         = "-1"
		cidr_blocks      = ["0.0.0.0/0"]
  	}
}

resource "aws_instance" "webapp" {
	ami = "ami-006d3995d3a6b963b"
	instance_type = "t2.micro"
	vpc_security_group_ids = [aws_security_group.apsgtf.id]
	key_name = "apaws"
	user_data = <<-EOF
#!/bin/bash
#
sudo apt update
sudo apt install nginx -y
sudo cat > /var/www/html/index.html <<ABC
This text is added using EC2-User-data.
ABC
EOF
	tags = {
		Name = "ap-tf-instance"
		App = "production"
	}
}

