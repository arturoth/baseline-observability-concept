resource "newrelic_alert_policy" "this" {
  name = local.newrelic.entity.policy
  incident_preference = "PER_CONDITION"

  depends_on = [
    data.newrelic_entity.this,
    time_sleep.wait_seconds
  ]
}

