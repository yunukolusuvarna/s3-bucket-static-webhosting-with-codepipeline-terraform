resource "aws_codestarconnections_connection" "easydeploy_github" {
  name          = "pipeline automation"
  provider_type = "GitHub"
}
