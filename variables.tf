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
}

variable "waypoint_add_on_instance" {
  type        = string
  description = "Name of the Waypoint add-on instance."

}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "AIHUB-TFE-POC"
}

variable "application_insights_connection_string" {
  description = "Connection string for Application Insights"
  type        = string
  sensitive   = true
  default     = ""
}

variable "application_insights_key" {
  description = "Application Insights Key"
  type        = string
  sensitive   = true
  default     = ""
}
