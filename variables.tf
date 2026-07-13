variable "batch_applications" {
  description = <<EOT
Map of batch_applications, attributes below
Required:
    - account_name
    - name
    - resource_group_name
Optional:
    - allow_updates
    - default_version
    - display_name
EOT

  type = map(object({
    account_name        = string
    name                = string
    resource_group_name = string
    allow_updates       = optional(bool)
    default_version     = optional(string)
    display_name        = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.batch_applications : (
        length(v.name) <= 64
      )
    ])
    error_message = "[from validate.ApplicationName: invalid when len(value) > 64]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_applications : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_applications : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_applications : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_applications : (
        length(v.account_name) <= 24
      )
    ])
    error_message = "[from validate.AccountName: invalid when len(value) > 24]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_applications : (
        v.default_version == null || (length(v.default_version) <= 64)
      )
    ])
    error_message = "[from validate.ApplicationVersion: invalid when len(value) > 64]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_applications : (
        v.display_name == null || (length(v.display_name) <= 1024)
      )
    ])
    error_message = "[from validate.ApplicationDisplayName: invalid when len(value) > 1024]"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

