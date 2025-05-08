# TT_values.auto.tfvars

plan_tags = {
  Plan = "hww-tt/terraform"
}

time_tracker_ns_name = "timetracker-helm-tf"
helm_release_name    = "timetracker"
docker_image_name    = "acrakslzaccel234.azurecr.io/timetracker"
docker_image_tag     = "8d60422c"
cs_kv_secret_name    = "azsql-db-connectionstring-timetracker"
