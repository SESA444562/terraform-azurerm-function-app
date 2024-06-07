
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

data "tfe_outputs" "root_application" {
  organization = "DXE-POC"
  workspace    = var.waypoint_application
}

data "azurerm_storage_account" "azf_storage_account" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.existing.name
}

resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "example" {
  name                       = "example-linux-function-app"
  resource_group_name        = data.azurerm_resource_group.existing.name
  location                   = data.azurerm_resource_group.existing.location
  storage_account_name       = data.azurerm_storage_account.azf_storage_account.name
  storage_account_access_key = data.azurerm_storage_account.azf_storage_account.primary_access_key

  service_plan_id = azurerm_service_plan.example.id

  site_config {
    application_insights_connection_string = data.tfe_outputs.root_application.values.app_insights_connection_string
    application_insights_key               = data.tfe_outputs.root_application.values.app_insights_key
  }
}
