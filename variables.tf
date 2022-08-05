variable "prod_access_key" {
  description = "access key"
}

variable "prod_secret_key" {
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

variable "projectname1" {
  default     = "easydeploy"
  description = "pipeline project name"
}

variable "repo1_id" {
  default     = "jerinrathnam/react-js-docker"
  description = "github repository id"
}

variable "repo1_branch_name" {
  default     = "main"
  description = "github branch name"
}
