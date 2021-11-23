variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "vpc cidr block"
    type =string
}

variable "public-sub-01" {
    default = "10.0.1.0/24"
    description = "public sub 01 cidr block"
    type =string
}

variable "public-sub-02" {
    default = "10.0.2.0/24"
    description = "public sub 02 cidr block"
    type =string
}

variable "private-sub-01" {
    default = "10.0.3.0/24"
    description = "private sub 01 cidr block"
    type =string
}

variable "private-sub-02" {
    default = "10.0.4.0/24"
    description = "private sub 01 cidr block"
    type =string
}

variable "Ami-id" {
    default = "ami-0fc15d50d39e4503c"
    description = "Ami"
    type =string
}


variable "region-varible" {
    default = "eu-west-2"
    description = "Region"
    type =string
}




