variable "do_region" {
  description = "The digital ocean region you'd like to deploy the cluster in"
  default     = "nyc3"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  default     = "do-k8s-chal"
}

variable "cluster_version" {
  description = "The version of Kubernetes to install ithee cluster"
  default     = "1.21.5-do.0"
}

variable "cluster_default_node_size" {
  description = "The size of the droplets in the default node pool in the cluster"
  default     = "s-2vcpu-4gb"
}

variable "cluster_default_node_count" {
  description = "The number of nodes in the default node pool in the cluster"
  default     = 3
}

variable "kubeconfig_path" {
  description = "The path to save the kubeconfig to"
  default     = "~/.kube/config"
}
