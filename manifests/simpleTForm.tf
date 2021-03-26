
variable "namespace" {
  type = string
}
variable "deployName" {
  type = string
}
variable "replicas" {
  type = number
}
resource "kubernetes_namespace" "test" {
  metadata {
    name = var.namespace
  }
}
resource "kubernetes_deployment" "test" {
  metadata {
    name      = var.deployName
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = "MyTestApp"
      }
    }
    template {
      metadata {
        labels = {
          app = "MyTestApp"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "nginx-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
