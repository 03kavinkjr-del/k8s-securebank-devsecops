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
        service_account_name = kubernetes_service_account.securebank_sa.metadata[0].name

        security_context {
          run_as_non_root = true
          run_as_user     = 10000
        }

        container {
          name  = "api"
          image = "securebank-api:v1"

          image_pull_policy = "Always"

          port {
            container_port = 5000
          }

          security_context {
            allow_privilege_escalation = false
            read_only_root_filesystem  = true

            capabilities {
              drop = ["ALL"]
            }
          }

          liveness_probe {
            http_get {
              path = "/health"
              port = 5000
            }

            initial_delay_seconds = 10
            period_seconds        = 10
          }

          readiness_probe {
            http_get {
              path = "/health"
              port = 5000
            }

            initial_delay_seconds = 5
            period_seconds        = 5
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
