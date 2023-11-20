resource "aws_ecr_repository" "my-ecr-repo" {
    name                 = "Abdelatif-ECR"
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }
}