variable "resource_group_location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "Terraform-RG"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "app_service_name" {
  default     = "vt-it-consulting-webapp"
  description = "Location of the resource group."
}


variable "app_service_plan" {
  default     = "vt-it-consulting-service-plan"
  description = "Location of the resource group."
}


