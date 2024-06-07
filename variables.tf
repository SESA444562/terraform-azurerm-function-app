variable "waypoint_application" {
  type        = string
  description = "Name of the Waypoint application."

  validation {
    condition     = !contains(["-", "_"], var.waypoint_application)
    error_message = "waypoint_application must not contain dashes or underscores."
  }
}

variable "waypoint_add_on_definition" {
  type        = string
  description = "Name of the Waypoint add-on definition."
  default     = ""
}

variable "waypoint_add_on" {
  type        = string
  description = "Name of the Waypoint add-on instance."
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "AIHUB-TFE-POC"
  validation {
    condition     = can(regex("^AIHUB-[A-Za-z]{3}-[A-Za-z]{3}$", var.resource_group_name))
    error_message = "The resource group name must be in the format AIHUB-XXX-YYY"
  }
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "poccdktfstorage"
}
