# digitalocean-k8s-challenge

## Description

My attempt at the Digital Ocean Kubernetes Challenge 2021 (https://do.co/kubernetes-challenge).
For my challenge, I chose to create a DO k8s cluster via `terraform`, then install and run `vcluster` to create vritual clusters.

The most challenging part of this exercise was getting `terraform` to work with the `digitalocean` terraform provider,
which I never used to this point. I decided to look for open-source terraform modules which easily created a DO k8s cluster;
that led me to https://github.com/jaxxstorm/terraform-digitalocean-kubernetes, which hadn't been updated in nearly two years!
Since I pulled the latest available version of terraform (1.1.1), I had to fork the provider and modify it to be compliant
with Terraform's latest provider definition requirements (see https://github.com/saidmasoud/terraform-digitalocean-kubernetes/pull/1).
At that point, I was able to create a cluster, install vcluster, and create virtual clusters. Fun exercise!

## Prerequisites

1. [Install terraform](https://www.terraform.io/downloads)
2. [Install kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
3. [Install helm](https://helm.sh/docs/intro/install/)
4. [Install vcluster](https://www.vcluster.com/)
5. Set up Digital Ocean account, [create a DO API key](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key), then save the key to `~/.do-token`

## Instructions

1. Clone this repo
2. Run `terraform init`
3. Run `terraform apply`
4. Set `$KUBECONFIG` in your env
5. Use `vcluster` to create a virtual cluster and set up a proxy connection to the virtual cluster
6. Open a new shell session, use the `kubeconfig.yaml` file created by `vcluster` to connect to your cluster

```sh
git clone https://github.com/saidmasoud/digitalocean-k8s-challenge.git
cd digitalocean-k8s-challenge
terraform init
terraform apply
export KUBECONFIG=$HOME/.kube/do-k8s-chal/config
# verify you can connect to your cluster
kubectl get ns
# create the virtual cluster(s)
vcluster create vcluster-test -n vcluster-test
vcluster connect vcluster-test -n vcluster-test
# in a new shell....
KUBECONFIG=kubeconfig.yaml kubectl get po # or whatever kubectl commands you want!!!
```

## Credits

https://github.com/maateen/do-k8s, which led me to https://github.com/jaxxstorm/terraform-digitalocean-kubernetes
