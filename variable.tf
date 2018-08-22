variable "create_vpc" {}

variable "create_sg" {}

variable "name" {}

variable "description" {
    default = "Sample SG"
}

variable "vpc_id" {}

variable "env" {}

variable "type" {}

variable "cidr_blocks" {
    type = "list"
}

variable "from_port" {}

variable "to_port" {}

variable "protocol" {}

variable "rule_description" {
    default = "A sample rule"
}