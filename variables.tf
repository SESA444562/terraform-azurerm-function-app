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
