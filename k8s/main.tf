terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "aws" {
  region  = var.region
}

provider "helm" {
  kubernetes {
    config_path = "../.kube-config"
  }
}

provider "kubernetes" {
  config_path    = "../.kube-config"
}
