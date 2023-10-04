resource "newrelic_nrql_alert_condition" "hits" {
  policy_id                      = newrelic_alert_policy.this.id
  type                           = "static"
  name                           = "${local.hits.name} - ${local.newrelic.entity.name}"
  enabled                        = local.hits.enabled
  violation_time_limit_seconds   = var.violation_time_limit_seconds

  nrql {
    query = "SELECT (sum(`aws.elasticache.CacheHits`) / (sum(`aws.elasticache.CacheHits`) + sum(`aws.elasticache.CacheMisses`))) * 100 as '%' FROM Metric WHERE entityGuid = '${data.newrelic_entity.this.guid}'"
  }

  critical {
    operator              = local.hits.operator
    threshold             = local.hits.threshold
    threshold_duration    = local.hits.threshold_duration
    threshold_occurrences = local.hits.threshold_occurrences
  }
  
  fill_option = "none"
  aggregation_window             = local.hits.aggregation_window
  aggregation_method = "event_flow"
  aggregation_delay = 120
  expiration_duration            = local.hits.expiration_duration
  open_violation_on_expiration   = local.hits.open_violation_on_expiration
  close_violations_on_expiration = local.hits.close_violations_on_expiration

  depends_on = [
    data.newrelic_entity.this,
    newrelic_alert_policy.this,
    time_sleep.wait_seconds
  ]
}

resource "newrelic_nrql_alert_condition" "max_connections" {
  policy_id                      = newrelic_alert_policy.this.id
  type                           = "static"
  name                           = "${local.max_connections.name} - ${local.newrelic.entity.name}"
  enabled                        = local.max_connections.enabled
  violation_time_limit_seconds   = var.violation_time_limit_seconds

  nrql {
    query = "SELECT average(`aws.elasticache.CurrConnections.byRedisNode`) FROM Metric WHERE entityGuid = '${data.newrelic_entity.this.guid}'"
  }

  critical {
    operator              = local.max_connections.operator
    threshold             = local.max_connections.threshold
    threshold_duration    = local.max_connections.threshold_duration
    threshold_occurrences = local.max_connections.threshold_occurrences
  }

  fill_option = "none"
  aggregation_window             = local.max_connections.aggregation_window
  aggregation_method = "event_flow"
  aggregation_delay = 120
  expiration_duration            = local.max_connections.expiration_duration
  open_violation_on_expiration   = local.max_connections.open_violation_on_expiration
  close_violations_on_expiration = local.max_connections.close_violations_on_expiration

  depends_on = [
    data.newrelic_entity.this,
    newrelic_alert_policy.this,
    time_sleep.wait_seconds
  ]
}

