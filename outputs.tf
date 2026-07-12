output "batch_applications_id" {
  description = "Map of id values across all batch_applications, keyed the same as var.batch_applications"
  value       = { for k, v in azurerm_batch_application.batch_applications : k => v.id }
}
output "batch_applications_account_name" {
  description = "Map of account_name values across all batch_applications, keyed the same as var.batch_applications"
  value       = { for k, v in azurerm_batch_application.batch_applications : k => v.account_name }
}
output "batch_applications_allow_updates" {
  description = "Map of allow_updates values across all batch_applications, keyed the same as var.batch_applications"
  value       = { for k, v in azurerm_batch_application.batch_applications : k => v.allow_updates }
}
output "batch_applications_default_version" {
  description = "Map of default_version values across all batch_applications, keyed the same as var.batch_applications"
  value       = { for k, v in azurerm_batch_application.batch_applications : k => v.default_version }
}
output "batch_applications_display_name" {
  description = "Map of display_name values across all batch_applications, keyed the same as var.batch_applications"
  value       = { for k, v in azurerm_batch_application.batch_applications : k => v.display_name }
}
output "batch_applications_name" {
  description = "Map of name values across all batch_applications, keyed the same as var.batch_applications"
  value       = { for k, v in azurerm_batch_application.batch_applications : k => v.name }
}
output "batch_applications_resource_group_name" {
  description = "Map of resource_group_name values across all batch_applications, keyed the same as var.batch_applications"
  value       = { for k, v in azurerm_batch_application.batch_applications : k => v.resource_group_name }
}

