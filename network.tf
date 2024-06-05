resource "aws_vpc" "ntier_vpc" {
  #cidr_block = "10.10.0.0/16"
  cidr_block = var.network_cidr_range
  tags = {
    Name = local.name
  }

}

resource "aws_subnet" "subnets" {
  count             = length(var.subnet_names)
  vpc_id            = aws_vpc.ntier_vpc.id
  availability_zone = var.subnet_azs[count.index]
  #cidr_block = "10.10.0.0/24"
  # cidr_block = var.subnet_cidr_ranges[count.index] This commented after format function
  #cidr_block = format(var.subnet_cidr_ranges, count.index) # format(spec, values...) structure of format function. 
  cidr_block = cidrsubnet(var.network_cidr_range, 8, count.index) #we commented above format function as we introduced cidrsubnet function which is better notation
  tags = {
    Name = var.subnet_names[count.index]
  }

  depends_on = [
    aws_vpc.ntier_vpc
  ]
}


data "aws_route_table" "default" {
  vpc_id = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc
  ]

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ntier_vpc.id

  tags = {
    Name = "ntier-igw"
  }

  depends_on = [
    aws_vpc.ntier_vpc
  ]
}

resource "aws_route" "igwroute" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.igw.id

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_internet_gateway.igw
  ]

}