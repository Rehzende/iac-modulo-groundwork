module "network_gcp" {
  source         = "git::https://github.com/mentoriaiac/iac-modulo-rede-gcp.git?ref=main"
  project        = local.workspace.project_name
  vpc_name       = local.workspace.vpc_name
  subnetworks    = local.workspace.subnetworks
  firewall_allow = local.workspace.firewall_allow
  region         = local.workspace.region
}
