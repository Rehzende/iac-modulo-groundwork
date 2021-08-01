locals {
  env = {
    default = {
      name = terraform.workspace
    }
    staging = {
      project_name   = ""
      vpc_name       = ""
      instance_name  = ""
      instance_image = "debian-cloud/debian-10"
      machine_type   = "e2-small"
      zone           = "us-east1-b"
      subnetworks = [
        {
          name          = ""
          ip_cidr_range = "10.0.0.0/16"
          region        = "us-east1"
        }
      ]
    firewall_allow = [
      {
        protocol = "tcp"
        port     = [443, 80, 22]
      }
    ]
    }
    production = {
    }
  }
  environmentvars = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
  workspace       = merge(local.env["default"], local.env[local.environmentvars])
}

locals {
  common_labels = {
    organization = "mentoria-iac"
    project      = "observabilidade"
    environment  = "observabilidade-${terraform.workspace}"
  }
}
