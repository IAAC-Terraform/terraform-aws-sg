resource "aws_security_group" "sg" {
  count = "${var.create_vpc && var.create_sg ? 1 : 0}"
  name        = "${var.name}-0${count.index}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  tags {
      env = "${var.env}"
      name        = "${var.name}-0${count.index}"
  }

  ingress {
    from_port = "${var.from_port}"
    to_port   = "${var.to_port}"
    protocol  = "${var.protocol}"
    cidr_blocks = ["${var.cidr_blocks}"]
  }
}
