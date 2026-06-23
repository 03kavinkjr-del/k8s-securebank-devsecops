resource "kubernetes_network_policy" "securebank_policy" {
  metadata {
    name      = "securebank-policy"
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress"]

    ingress {}
  }
}
