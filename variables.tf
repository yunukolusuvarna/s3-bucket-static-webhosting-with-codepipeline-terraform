variable "access_key" {
  description = "access key"
}

variable "secret_key" {
  description = "secret key"
}

variable "pipeline_bucket_name" {
  default     = "test-638140"
  description = "pipeline bucket name"
}

variable "app_bucket_name" {
  default     = "easydeploy-test-638140"
  description = "app bucket name"
}

variable "projectname" {
  default     = "easydeploy"
  description = "pipeline project name"
}

variable "repo_id" {
  default     = "easydeploy-cloud/reactjs-app-for-s3-static-webhosting"
  description = "github repository id"
}

variable "repo_branch_name" {
  default     = "main"
  description = "github branch name"
}

variable "connection_arn" {
  type        = string
  description = "Arn for the CodeStar Connection"
}