variable "network_cidr_range" {
  type = string
  #default     = "10.10.0.0/16"
  description = "This is vpc network range"

}

# variable "subnet_cidr_ranges" {
#   type        = list(string)
#   default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]
#   description = "These are subnet cidr network ranges"

# }

# variable "subnet_cidr_ranges" {
#   type        = string          # As its string now due to format function so we replaced list(string) with string
#   default     = "10.10.%g.0/24" # Here we used format function and as its string so we removed here brackets []
#   description = "These are subnet cidr network ranges"

# }    # we commented whole subnet_cidr_ranges as we dont need them as we introduced cidrsubnet function into network.tf so further we dont need this 


variable "subnet_names" {
  type = list(string)
  #default     = ["web1", "web2", "app1", "app2", "db1", "db2"]
  description = "These are subnet names"

}

variable "subnet_azs" {
  type = list(string)
  #default = ["us-west-1b", "us-west-1c", "us-west-1b", "us-west-1c", "us-west-1b", "us-west-1c"]

}
variable "db_subnet_names" {
  type = list(string)
  #default     = ["db1", "db2"]
  description = "These are db subnet names"
}
variable "websg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string


    }))

  })
  # default = {
  #   name        = "websg"
  #   description = "This is web security group"
  #   rules = [{
  #     type       = "ingress"
  #     from_port  = "80"
  #     to_port    = "80"
  #     protocol   = "tcp"
  #     cidr_block = "0.0.0.0/0"

  #     },
  #     {
  #       type       = "ingress"
  #       from_port  = "22"
  #       to_port    = "22"
  #       protocol   = "tcp"
  #       cidr_block = "0.0.0.0/0"

  #     },
  #     {
  #       type       = "egress"
  #       from_port  = "0"
  #       to_port    = "65535"
  #       protocol   = "-1"
  #       cidr_block = "0.0.0.0/0"
  #   }]
  # }

}


variable "appsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string


    }))

  })
  # default = {
  #   name        = "appsg"
  #   description = "This is app security group"
  #   rules = [{
  #     type       = "ingress"
  #     from_port  = "8080"
  #     to_port    = "8080"
  #     protocol   = "tcp"
  #     cidr_block = "0.0.0.0/0"

  #     },
  #     {
  #       type       = "ingress"
  #       from_port  = "5000"
  #       to_port    = "5000"
  #       protocol   = "tcp"
  #       cidr_block = "10.10.0.0/16"

  #     },
  #     {
  #       type       = "egress"
  #       from_port  = "0"
  #       to_port    = "65535"
  #       protocol   = "-1"
  #       cidr_block = "0.0.0.0/0"
  #   }]
  # }

}


variable "dbsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string


    }))

  })
  # default = {
  #   name        = "dbsg"
  #   description = "This is db security group"
  #   rules = [{
  #     type       = "ingress"
  #     from_port  = "6000"
  #     to_port    = "6000"
  #     protocol   = "tcp"
  #     cidr_block = "0.0.0.0/0"

  #     },
  #     {
  #       type       = "ingress"
  #       from_port  = "3306"
  #       to_port    = "3306"
  #       protocol   = "tcp"
  #       cidr_block = "10.10.0.0/16"

  #     },
  #     {
  #       type       = "egress"
  #       from_port  = "0"
  #       to_port    = "65535"
  #       protocol   = "-1"
  #       cidr_block = "0.0.0.0/0"
  #   }]
  # }

}
