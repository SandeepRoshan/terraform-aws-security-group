locals {
    security_group_tags = {
        Name = "security-group-${ var.in_ecosystem }-${ var.in_timestamp }-${ count.index }"
        Desc = "New security group ${ var.in_ecosystem } ${ var.in_description } ${ count.index }"
    }
}

resource "aws_security_group" "new" {
  count       = var.in_sg_count
  vpc_id      = var.in_vpc_id
  name        = "security-group-${ var.in_ecosystem }-${ var.in_timestamp }-${ count.index }"
  description = "This new security group ${ var.in_description } ${ count.index }"
  tags        = merge(
    {
      Name = "security-group-${ var.in_ecosystem }-${ var.in_timestamp }-${ count.index }"
      Desc = "New security group ${ var.in_ecosystem } ${ var.in_description } ${ count.index }"
    },
    var.in_mandated_tags
  )
}


resource "aws_security_group_rule" "ingress" {
  count = length(var.in_ingress)
  security_group_id = aws_security_group.new[count.index % var.in_sg_count].id

  type        = "ingress"
  cidr_blocks = var.in_ingress_cidr_blocks
  description = element(var.rules[var.in_ingress[count.index]], 3)

  from_port = element(var.rules[var.in_ingress[count.index]], 0)
  to_port   = element(var.rules[var.in_ingress[count.index]], 1)
  protocol  = element(var.rules[var.in_ingress[count.index]], 2)
}

resource "aws_security_group_rule" "egress" {
  count = length(var.in_egress)
  security_group_id = aws_security_group.new[count.index % var.in_sg_count].id

  type        = "egress"
  cidr_blocks = var.in_egress_cidr_blocks
  description = element(var.rules[var.in_egress[count.index]], 3)

  from_port = element(var.rules[var.in_egress[count.index]], 0)
  to_port   = element(var.rules[var.in_egress[count.index]], 1)
  protocol  = element(var.rules[var.in_egress[count.index]], 2)
}

