resource "aws_ecr_repository" "customer-ecr" {
    name                 = "abdelatif-ecr-customer"
    image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "product-ecr" {
    name                 = "abdelatif-ecr-product"
    image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "order-ecr" {
    name                 = "abdelatif-ecr-order"
    image_tag_mutability = "MUTABLE"
}