variable "project_id" {
  type        = string
  description = "GCP project ID where the Artifact Registry repository will be created."
}

variable "location" {
  type        = string
  description = "GCP region for the Artifact Registry repository."
  default     = "asia-south1"
}

variable "repository_id" {
  type        = string
  description = "Unique Artifact Registry repository identifier."
}

variable "description" {
  type        = string
  description = "Description for the repository."
  default     = "Artifact Registry repository"
}

variable "format" {
  type        = string
  description = "Repository package format."
  default     = "DOCKER"

  validation {
    condition = contains([
      "DOCKER",
      "MAVEN",
      "NPM",
      "PYTHON",
      "APT",
      "YUM"
    ], var.format)
    error_message = "format must be one of DOCKER, MAVEN, NPM, PYTHON, APT, or YUM."
  }
}

variable "mode" {
  type        = string
  description = "Artifact Registry repository mode."
  default     = "STANDARD_REPOSITORY"

  validation {
    condition = contains([
      "STANDARD_REPOSITORY",
      "REMOTE_REPOSITORY",
      "VIRTUAL_REPOSITORY"
    ], var.mode)
    error_message = "mode must be STANDARD_REPOSITORY, REMOTE_REPOSITORY, or VIRTUAL_REPOSITORY."
  }
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to the repository."
  default     = {}
}

variable "kms_key_name" {
  type        = string
  description = "Optional CMEK key resource name."
  default     = ""
}

variable "cleanup_policy_dry_run" {
  type        = bool
  description = "Whether cleanup policies execute in dry-run mode."
  default     = true
}
