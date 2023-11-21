resource "null_resource" "run_command" {
    provisioner "local-exec" {
        command = "aws eks --region eu-west-1 update-kubeconfig --name Abdelatif-K8sCluster && kubectl create namespace argocd && kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml && kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.2/cert-manager.yaml" 
    }

    depends_on = [ aws_eks_cluster.K8sCluster ]
}