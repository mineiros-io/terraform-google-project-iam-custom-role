# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "role_id" {
  type        = string
  description = "(Required) The camelCaseRoleId to use for this role."
}

variable "title" {
  type        = string
  description = "(Required) A human-readable title for the role."
}

variable "permissions" {
  type        = set(string)
  description = "(Required) The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified."

  validation {
    condition     = length(var.permissions) >= 1
    error_message = "At least one 'permission' must be specified."
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# These variables have defaults, but may be overridden.
# ---------------------------------------------------------------------------------------------------------------------

variable "stage" {
  type        = string
  description = "(Optional) The current launch stage of the role. Defaults to GA. For more stages visit this link 'https://cloud.google.com/iam/docs/reference/rest/v1/organizations.roles#Role.RoleLaunchStage'."
  default     = "GA"
}

variable "description" {
  type        = string
  description = "(Optional) A human-readable description for the role."
  default     = null
}

# ------------------------------------------------------------------------------
# MODULE CONFIGURATION PARAMETERS
# These variables are used to configure the module.
# See https://medium.com/mineiros/the-ultimate-guide-on-how-to-write-terraform-modules-part-1-81f86d31f024
# ------------------------------------------------------------------------------

variable "module_enabled" {
  type        = bool
  description = "(Optional) Whether to create resources within the module or not. Default is 'true'."
  default     = true
}

variable "module_depends_on" {
  type        = any
  description = "(Optional) A list of external resources the module depends_on. Default is '[]'."
  default     = []
}
