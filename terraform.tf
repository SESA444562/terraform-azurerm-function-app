terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
    tfe = {
      version = "~> 0.55.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "tfe" {
}
