output "region" {
  value = data.aws_region.current.name
}

output "cluster_name" {
  value = aws_eks_cluster.this.name
}
output "k8s_version" {
  value = aws_eks_cluster.this.version
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}
locals {
   kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    certificate-authority: ${aws_eks_cluster.this.certificate_authority[0].data}
    server: ${aws_eks_cluster.this.endpoint}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec: 
	  apiVersion: client.authecation.k8s.io/v1apha1
	  command: aws-iam-authenticator
	  args:
	    - "token"
		- "-i"
		- "var.cluster.name"
KUBECONFIG
}
output "kubeconfig" {
  value = local.kubeconfig
}

#terraform output 	kubeconfig >> ~/.kubeconfig
