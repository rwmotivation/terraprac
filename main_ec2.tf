
provider "aws" {
	region = "ap-south-1"
}

# resouce "PROIVDER_TYPE" "NAME_OF_THE_RESOUCE" {
# CONFIGURATION
#}

resource "aws_instance" "webapp" {
	ami = "ami-006d3995d3a6b963b"
	instance_type = "t2.micro"

	tags = {
		Name = "ap-tf-instance"
		App = "production"
	}
}

resource "aws_instance" "webapp2" {
        ami = "ami-006d3995d3a6b963b"
        instance_type = "t2.micro"

        tags = {
                Name = "ap-tf-instance"
                App = "production"
        }
}

