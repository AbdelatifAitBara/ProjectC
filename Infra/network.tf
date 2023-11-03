# The VPC was createt manually "Abdealtif-VPC"
# The IGW was created manually "Abdelatif-IGW"

# Create PublicSubnet01 on eu-west-1a

resource "aws_subnet" "PublicSubnet01" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_PublicSubnet01
  map_public_ip_on_launch = true
  availability_zone       = var.az-a

  tags = {
    Name     = "Abdelatif-PublicSubnet01"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Create Route Table on eu-west-1a

resource "aws_route_table" "PublicRouteTable-1A" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name     = "Abdelatif-PublicRouteTable-1A"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Associate Route Table 1A with PublicSubnet01

resource "aws_route_table_association" "PublicRouteTable-1A" {
  subnet_id      = aws_subnet.PublicSubnet01.id
  route_table_id = aws_route_table.PublicRouteTable-1A.id
}