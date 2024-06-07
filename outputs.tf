
output "function_app_name" {
  value       = azurerm_linux_function_app.example.name
  description = "Name of the Function App"
}

output "function_app_url" {
  value       = azurerm_linux_function_app.example.default_hostname
  description = "URL of the Function App"
}
