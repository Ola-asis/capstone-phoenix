resource "aws_security_group" "k8s_cluster" {
  name        = "${var.project_name}-cluster-sg"
  description = "Least privilege SG for k3s multi-node cluster"
  vpc_id      = var.vpc_id

  # SSH restricted to your IP only
  ingress {
    description = "SSH from admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # K8s API endpoint restricted to your IP only
  ingress {
    description = "K8s API endpoint from admin IP"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # Ingress traffic
  ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Node-to-node cluster communication
  ingress {
    description = "All traffic between cluster nodes"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-cluster-sg"
  }
}
