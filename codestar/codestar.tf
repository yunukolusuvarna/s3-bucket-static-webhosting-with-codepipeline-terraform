variable "access_key" {
  description = "access key"
}

variable "secret_key" {
  description = "secret key"
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_codestarconnections_connection" "easydeploy_github" {
  name          = "pipeline automation"
  provider_type = "GitHub"
}
