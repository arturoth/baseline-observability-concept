data "newrelic_entity" "this" {
  name = local.newrelic.entity.name
}

resource "time_sleep" "wait_seconds" {
  create_duration = var.integration == "pull" ? "360s" : "60s"

  depends_on = [
    data.newrelic_entity.this
  ]
}

