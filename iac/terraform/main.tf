resource "kubernetes_pod" "UMA_Test_2" {
  metadata {
    name = "UMA_Test_2"
    namespace = "evolved5g"
    labels = {
      app = "App_UMA_Test_2"
    }
  }

  spec {
    container {
      image = "dockerhub.hi.inet/evolved-5g/dummy-netapp:latest"
      name  = "dummy-netapp"
    }
  }
}

resource "kubernetes_service" "UMA_Test_2_service" {
  metadata {
    name = "ExampleService"
    namespace = "evolved5g"
  }
  spec {
    selector = {
      app = kubernetes_pod.UMA_Test_2.metadata.0.labels.app
    }
    port {
      port = 8080
      target_port = 8080
    }
  }
}
