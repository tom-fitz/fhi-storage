#############################
## Application - Variables ##
#############################

# company name
variable "company" {
  type        = string
  description = "This variable defines the company name used to build resources"
  default = "test"
}

# application name
variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
  default = "storage"
}

# environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
  default = "dev"
}

# azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "West US 2"
}

# azure region shortname
variable "region" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "westus2"
}

# owner
variable "owner" {
  type        = string
  description = "Specify the owner of the resource"
  default = "Thomas Fitzgerald"
}

# description
variable "description" {
  type        = string
  description = "Provide a description of the resource"
  default = "Storage app for Fitzgerald Home Interiors"
}