resource "kubernetes_network_policy" "securebank_policy" {
  metadata {
    name      = "securebank-policy"
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name
  }

  spec {
    pod_selector {
      match_labels = {
        app = "securebank-api"
      }
    }

    policy_types = [
      "Ingress",
      "Egress"
    ]

    ingress {
      from {
        pod_selector {}
      }
    }

    egress {}
  }
}
