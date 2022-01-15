variable "github_username" {
  description = "Github Username."
  type        = string
}

variable "github_repo_name" {
  description = "Name of the target repository."
  type        = string
}

variable "github_access_token" {
  description = "Personal access token for the admin access to the repository"
  type        = string
}