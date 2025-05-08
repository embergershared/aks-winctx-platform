variable "rgLzName" {
  type = string
}
variable "location" {
  type    = string
  default = "eastus2"
}

# TimeTracker specific variables
variable "namespace_name" { default = "classifieds" }
variable "helm_release_name" {}
variable "docker_image_name" {}
variable "docker_image_tag" {}
variable "cl_cs_kv_secret_name" {}
variable "tt_cs_kv_secret_name" {}
