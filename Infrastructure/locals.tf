locals {
  tags = {
    owner    = "aait-bara@thenuumfactory.fr"
    ephemere = "non"
    entity   = "numfactory"
    eks_endpoint = outputs.eks_cluster_endpoint.value
  }
  
}