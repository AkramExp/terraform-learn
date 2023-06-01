provider "aws" {}

variable "subnet_cidr_block" {
    description = "subnet cidr block"
}

resource "aws_vpc" "development-vpc" {
    cidr_block = var.subnet_cidr_block
    tags = {
        Name: "development"
    }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "ap-south-1a"
}