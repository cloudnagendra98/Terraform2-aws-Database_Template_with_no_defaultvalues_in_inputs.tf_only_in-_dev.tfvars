resource "aws_security_group" "websg" {
  vpc_id      = aws_vpc.ntier_vpc.id
  name        = var.websg_config.name
  description = var.websg_config.description

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets
  ]

}

# resource "aws_security_group" "websg" {
#     vpc_id = aws_vpc.ntier_vpc.id
#     name = "websg"
#     description = "This is web security group"

# }

resource "aws_security_group_rule" "websg_rules" {
  count             = length(var.websg_config.rules)
  type              = var.websg_config.rules[count.index].type
  protocol          = var.websg_config.rules[count.index].protocol
  from_port         = var.websg_config.rules[count.index].from_port
  to_port           = var.websg_config.rules[count.index].to_port
  security_group_id = aws_security_group.websg.id
  cidr_blocks       = [var.websg_config.rules[count.index].cidr_block]

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets,
    aws_security_group.websg
  ]

}

# resource "aws_security_group_rule" "openhttp" {
#     type = "ingress"
#     from_port = "80"
#     to_port = "80"
#     protocol = "tcp"
#     security_group_id = aws_security_group.websg.id
#     #cidr_block = var.network_cidr_range

#     depends_on = [ 
#         aws_vpc.ntier_vpc,
#         aws_subnet.subnets,
#         aws_security_group.websg
#      ]

# }

# resource "aws_security_group_rule" "openssh" {
#     type = "ingress"
#     from_port = "22"
#     to_port = "22"
#     protocol = "tcp"
#     security_group_id = aws_security_group.websg.id

#      depends_on = [ 
#         aws_vpc.ntier_vpc,
#         aws_subnet.subnets,
#         aws_security_group.websg
#      ]

# }


# resource "aws_security_group_rule" "websgout" {
#     type = "egress"
#     from_port = "0"
#     to_port = "65535"
#     protocol = "-1"
#     security_group_id = aws_security_group.websg.id

#      depends_on = [ 
#         aws_vpc.ntier_vpc,
#         aws_subnet.subnets,
#         aws_security_group.websg
#      ]
# }

resource "aws_security_group" "appsg" {
  vpc_id      = aws_vpc.ntier_vpc.id
  name        = var.appsg_config.name
  description = var.appsg_config.description

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets
  ]

}

resource "aws_security_group_rule" "appsg_rules" {
  count             = length(var.appsg_config.rules)
  type              = var.appsg_config.rules[count.index].type
  protocol          = var.appsg_config.rules[count.index].protocol
  from_port         = var.appsg_config.rules[count.index].from_port
  to_port           = var.appsg_config.rules[count.index].to_port
  security_group_id = aws_security_group.appsg.id
  cidr_blocks       = [var.appsg_config.rules[count.index].cidr_block]

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets,
    aws_security_group.appsg
  ]

}

resource "aws_security_group" "dbsg" {
  vpc_id      = aws_vpc.ntier_vpc.id
  name        = var.dbsg_config.name
  description = var.dbsg_config.description

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets
  ]

}

resource "aws_security_group_rule" "dbsg_rules" {
  count             = length(var.dbsg_config.rules)
  type              = var.dbsg_config.rules[count.index].type
  protocol          = var.dbsg_config.rules[count.index].protocol
  from_port         = var.dbsg_config.rules[count.index].from_port
  to_port           = var.dbsg_config.rules[count.index].to_port
  security_group_id = aws_security_group.dbsg.id
  cidr_blocks       = [var.dbsg_config.rules[count.index].cidr_block]

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_subnet.subnets,
    aws_security_group.dbsg
  ]

}
