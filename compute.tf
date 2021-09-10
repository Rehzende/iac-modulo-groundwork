module "compute_gcp" {
  source         = "git::https://github.com/mentoriaiac/iac-modulo-compute-gcp.git?ref=main"
  project        = local.workspace.project_name
  instance_name  = "nomedainstancia"
  instance_image = "debian-cloud/debian-10"
  machine_type   = "e2-small"
  zone           = "us-east1-d"
  network        = module.network_gcp.vpc_id
  subnetwork     = module.network_gcp.subnets_id[0].id
  labels = {
    value = "key"
  }
}
