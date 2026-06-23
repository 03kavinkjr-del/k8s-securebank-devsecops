resource "kubernetes_deployment" "securebank_api" {
  metadata {
    name      = "securebank-api"
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name

    labels = {
      app = "securebank-api"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "securebank-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "securebank-api"
        }
      }

      spec {
        container {
          image = "securebank-api:v1"
          name  = "api"

          image_pull_policy = "Never"

          port {
            container_port = 5000
          }

          resources {
            limits = {
              cpu    = "250m"
              memory = "256Mi"
            }

            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}
