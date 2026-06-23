resource "kubernetes_service" "securebank_service" {
  metadata {
    name      = "securebank-service"
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name
  }

  spec {
    selector = {
      app = "securebank-api"
    }

    port {
      port        = 80
      target_port = 5000
    }

    type = "NodePort"
  }
}
