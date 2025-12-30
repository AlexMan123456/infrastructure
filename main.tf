terraform {
  required_version = ">= 1.0.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

variable "github_token" {
  description = "GitHub token."
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub username."
  type        = string
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "album" {
  name        = "commit-to-you"
  description = "Source files for the Commit To You album (Logic Pro + SynthV sources)."
  visibility  = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  allow_merge_commit = true
  allow_rebase_merge = true
  allow_squash_merge = false
}
