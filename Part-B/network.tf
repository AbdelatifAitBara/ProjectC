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

# Create PublicSubnet02 on eu-west-1b

resource "aws_subnet" "PublicSubnet02" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_PublicSubnet02
  map_public_ip_on_launch = true
  availability_zone       = var.az-b

  tags = {
    Name     = "Abdelatif-PublicSubnet02"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}



# Create Public Route Table on eu-west-1a

resource "aws_route_table" "PublicRouteTable-1A" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name     = "Abdelatif-PublicRouteTable"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Associate Route Table 1A with PublicSubnet01 and PublicSubnet02

resource "aws_route_table_association" "PublicRouteTable-1A" {
  subnet_id      = aws_subnet.PublicSubnet01.id
  route_table_id = aws_route_table.PublicRouteTable-1A.id
}

resource "aws_route_table_association" "PublicRouteTable-1B" {
  subnet_id      = aws_subnet.PublicSubnet02.id
  route_table_id = aws_route_table.PublicRouteTable-1A.id
}



# Create a PrivateSubnet01 on eu-west-1a

resource "aws_subnet" "PrivateSubnet01" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_PrivateSubnet01
  map_public_ip_on_launch = false
  availability_zone       = var.az-a

  tags = {
    Name     = "Abdelatif-PrivateSubnet01"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}


# Create a PrivateSubnet02 on eu-west-1b

resource "aws_subnet" "PrivateSubnet02" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_PrivateSubnet02
  map_public_ip_on_launch = false
  availability_zone       = var.az-b

  tags = {
    Name     = "Abdelatif-PrivateSubnet02"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }

}

# Create Route Table on eu-west-1b

resource "aws_route_table" "PrivateRouteTable-1B" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.ngw-vpc-b
  }

  tags = {
    Name     = "Abdelatif-PrivateRouteTable"
    owner    = local.tags.owner
    ephemere = local.tags.ephemere
    entity   = local.tags.entity
  }
}

# Associate Route Table 1B with PrivateSubnet02

resource "aws_route_table_association" "PrivateRouteTable-1B" {
  subnet_id      = aws_subnet.PrivateSubnet01.id
  route_table_id = aws_route_table.PrivateRouteTable-1B.id
}

resource "aws_route_table_association" "PrivateRouteTable-2B" {
  subnet_id      = aws_subnet.PrivateSubnet02.id
  route_table_id = aws_route_table.PrivateRouteTable-1B.id
}

