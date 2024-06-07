mock_provider "azurerm" {}
mock_provider "tfe" {
  mock_data "tfe_outputs" {
    defaults = {
      values = {
        application_insights_connection_string = "mocked-app-insights-connection-string"
        application_insights_key               = "mocked-app-insights-key"
      }
    }
  }
}

variables {
  waypoint_application = "waypoint-application"
  good_rg_name = "AIHUB-TFE-POC"
}

run "valid_rg_name" {
  command = plan

  variables {
    resource_group_name = var.good_rg_name
  }
}

run "invalid_empty_rg_name" {
  command = plan

  variables {
    resource_group_name = ""
  }

  expect_failures = [
    var.resource_group_name,
  ]
}

run "invalid_format_rg_name" {
  command = plan

  variables {
    resource_group_name = "AIHUB-ERROR"
  }

  expect_failures = [
    var.resource_group_name,
  ]
}
