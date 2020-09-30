resource "aws_ecr_repository" "docker-tflint" {
  name = "docker-tflint"
  tags = merge(
    local.common_tags,
    { DockerHub : "dwpdigital/docker-tflint" }
  )
}

resource "aws_ecr_repository_policy" "docker-tflint" {
  repository = aws_ecr_repository.docker-tflint.name
  policy     = data.terraform_remote_state.management.outputs.ecr_iam_policy_document
}

output "ecr_example_url" {
  value = aws_ecr_repository.docker-tflint.repository_url
}
