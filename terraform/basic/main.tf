terraform {
  required_version = ">= 1.15.0, < 1.16.0"
}

variable "runner_name" {
  description = "Name of the GitHub Actions runner executing Terraform."
  type        = string
  default     = "gha-runner"
}

# terraform_data is built into Terraform, so this example needs no cloud
# account, credentials, or external provider plugin.
resource "terraform_data" "runner_test" {
  input = {
    message     = "Terraform executed successfully on the Vagrant runner."
    repository  = "mklmfane/skills-introduction-to-github"
    runner_name = var.runner_name
  }
}

output "runner_test" {
  description = "Proof that Terraform planned and applied the example."
  value       = terraform_data.runner_test.output
}
