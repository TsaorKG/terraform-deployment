# Uncomment resources below and add required arguments.
variable "security_group_name" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-3b"

  tags {
    Name = "Main"
  }
}

resource "aws_security_group" "testSecurityGroup" {
  # 1. Define logical names (identifiers) for resource.  #    E.g.: resource "type" "resource_logical_name" {}  #    Docs: https://www.terraform.io/docs/providers/aws/r/security_group.html

  # 2. Set psysical name of your security group below in format "yourname-"
  name        = "${var.security_group_name}"
  description = "Test security group."
  vpc_id      = "${aws_vpc.main.id}"
}

resource "aws_instance" "testEC2" {
  # 1. Add resource name.  # 2. Specify VPC subnet ID  # 3. Specify EC2 instance type.  # 4. Specify Security group for this instance (use one that we create above).  # Docs: https://www.terraform.io/docs/providers/aws/r/instance.html

  subnet_id = "${aws_subnet.main.id}"

  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.testSecurityGroup.id}"]
  associate_public_ip_address = true
  key_name                    = "terraform_rsa"

  # user_data = "${file("../shared/user-data.txt")}"
  tags {
    Name = "w1-myinstance"
  }

  # Keep these arguments as is:
  #ami               = "ami-cb2305a1"
  ami = "ami-969c2deb"

  availability_zone = "${aws_subnet.main.availability_zone}"
}
