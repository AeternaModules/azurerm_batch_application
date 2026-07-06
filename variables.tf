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
    allow_updates       = optional(bool) # Default: true
    default_version     = optional(string)
    display_name        = optional(string)
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_batch_application's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ApplicationName] !regexp.MustCompile(`^[-_\da-zA-Z]+$`).MatchString(value)
  # path: name
  #   source:    [from validate.ApplicationName] 1 > len(value)
  # path: name
  #   condition: length(value) <= 64
  #   message:   [from validate.ApplicationName: invalid when len(value) > 64]
  #   source:    [from validate.ApplicationName: invalid when len(value) > 64]
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: account_name
  #   source:    [from validate.AccountName] !regexp.MustCompile(`^[a-z0-9]+$`).MatchString(value)
  # path: account_name
  #   source:    [from validate.AccountName] 3 > len(value)
  # path: account_name
  #   condition: length(value) <= 24
  #   message:   [from validate.AccountName: invalid when len(value) > 24]
  #   source:    [from validate.AccountName: invalid when len(value) > 24]
  # path: default_version
  #   source:    [from validate.ApplicationVersion] !regexp.MustCompile(`^[-._\da-zA-Z]+$`).MatchString(value)
  # path: default_version
  #   source:    [from validate.ApplicationVersion] 1 > len(value)
  # path: default_version
  #   condition: length(value) <= 64
  #   message:   [from validate.ApplicationVersion: invalid when len(value) > 64]
  #   source:    [from validate.ApplicationVersion: invalid when len(value) > 64]
  # path: display_name
  #   source:    [from validate.ApplicationDisplayName] 1 > len(value)
  # path: display_name
  #   condition: length(value) <= 1024
  #   message:   [from validate.ApplicationDisplayName: invalid when len(value) > 1024]
  #   source:    [from validate.ApplicationDisplayName: invalid when len(value) > 1024]
}

