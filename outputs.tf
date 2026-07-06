output "batch_applications" {
  description = "All batch_application resources"
  value       = azurerm_batch_application.batch_applications
}
output "batch_applications_account_name" {
  description = "List of account_name values across all batch_applications"
  value       = [for k, v in azurerm_batch_application.batch_applications : v.account_name]
}
output "batch_applications_allow_updates" {
  description = "List of allow_updates values across all batch_applications"
  value       = [for k, v in azurerm_batch_application.batch_applications : v.allow_updates]
}
output "batch_applications_default_version" {
  description = "List of default_version values across all batch_applications"
  value       = [for k, v in azurerm_batch_application.batch_applications : v.default_version]
}
output "batch_applications_display_name" {
  description = "List of display_name values across all batch_applications"
  value       = [for k, v in azurerm_batch_application.batch_applications : v.display_name]
}
output "batch_applications_name" {
  description = "List of name values across all batch_applications"
  value       = [for k, v in azurerm_batch_application.batch_applications : v.name]
}
output "batch_applications_resource_group_name" {
  description = "List of resource_group_name values across all batch_applications"
  value       = [for k, v in azurerm_batch_application.batch_applications : v.resource_group_name]
}

