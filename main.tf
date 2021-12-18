data "local_file" "token" {
    filename = pathexpand("~/.do-token")
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = chomp(data.local_file.token.content)
}

module "kubernetes_cluster" {
  source                     = "git::ssh://git@github.com/saidmasoud/terraform-digitalocean-kubernetes?ref=remove-provider"
  do_token                   = chomp(data.local_file.token.content)
  do_region                  = var.do_region
  cluster_name               = var.cluster_name
  cluster_default_node_size  = var.cluster_default_node_size
  cluster_default_node_count = var.cluster_default_node_count
  cluster_version            = var.cluster_version
  kubeconfig_path            = pathexpand("~/.kube/do-k8s-chal/config")
}
