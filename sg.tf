resource "aws_security_group" "sg" {
  count = "${var.create_vpc && var.create_sg ? 1 : 0}"
  name        = "${var.name}-0${count.index}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  tags {
      env = "${var.env}"
      name        = "${var.name}-0${count.index}"
  }
}

resource "aws_security_group_rule" "ingress_rules" {
  count = "${var.create_vpc ? 1 : 0}"
  security_group_id = "${element(aws_security_group.sg.*.id, count.index)}"
  type              = "${var.type}"
  cidr_blocks = ["${var.cidr_blocks}"]
  from_port = "${var.from_port}"
  to_port   = "${var.to_port}"
  protocol  = "${var.protocol}"
  description = "${var.rule_description}"
}