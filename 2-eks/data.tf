data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "laxmanraju-statefile-logs"
    key    = "env/terraform.tfstate"
    region = "us-east-1"
  }
}

# Fetch the latest supported vpc-cni addon version for your cluster
data "aws_eks_addon_version" "vpc_cni" {
  addon_name         = "vpc-cni"
  kubernetes_version = module.eks.cluster_version
  most_recent        = true
}

data "aws_eks_addon_version" "kube_proxy" {
  addon_name         = "kube-proxy"
  kubernetes_version = module.eks.cluster_version
  most_recent        = true
}

data "aws_eks_addon_version" "coredns" {
  addon_name         = "coredns"
  kubernetes_version = module.eks.cluster_version
  most_recent        = true
}


