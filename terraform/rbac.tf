resource "kubernetes_service_account" "securebank_sa" {
  metadata {
    name      = "securebank-sa"
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name
  }
}

resource "kubernetes_role" "securebank_role" {
  metadata {
    name      = "securebank-role"
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]

    verbs = [
      "get",
      "list"
    ]
  }
}

resource "kubernetes_role_binding" "securebank_binding" {
  metadata {
    name      = "securebank-binding"
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.securebank_role.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.securebank_sa.metadata[0].name
    namespace = kubernetes_namespace.securebank_tf.metadata[0].name
  }
}
