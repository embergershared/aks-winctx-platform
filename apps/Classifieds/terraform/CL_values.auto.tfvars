# CL_values.auto.tfvars

plan_tags = {
  Plan = "hww-cl/terraform"
}

namespace_name       = "classifieds-helm-terraform"
helm_release_name    = "classifieds"
docker_image_name    = "acrakslzaccel234.azurecr.io/classifieds"
docker_image_tag     = "bdc91a8d"
cl_cs_kv_secret_name = "azsql-db-connectionstring-classifieds"
tt_cs_kv_secret_name = "azsql-db-connectionstring-timetracker"
