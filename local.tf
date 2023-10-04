locals {
  newrelic = {
    entity = {
      policy = "default-entity"
      name   = var.ENTITY_NAME
    }
  }
  hits = {
    enabled                        = true
    name                           = "Elasticache CacheHits"
    description                    = "Comparative between CacheHits vs CacheMisses are increase."
    operator                       = "above"
    threshold                      = 90
    threshold_duration             = var.integration == "pull" ? 300 : 60
    threshold_occurrences          = "at_least_once"
    aggregation_window             = var.integration == "pull" ? 300 : 60
    expiration_duration            = var.integration == "pull" ? 300 : 120
    open_violation_on_expiration   = var.integration == "pull" ? false : true
    close_violations_on_expiration = var.integration == "pull" ? false : true
  }
  max_connections = {
    enabled                        = true
    name                           = "Elasticache near to max connections"
    description                    = "Connections are increase more than instance could be support. Consider review connections or scaling vertically."
    operator                       = "above"
    threshold                      = 500
    threshold_duration             = var.integration == "pull" ? 300 : 60
    threshold_occurrences          = "at_least_once"
    aggregation_window             = var.integration == "pull" ? 300 : 60
    expiration_duration            = var.integration == "pull" ? 300 : 120
    open_violation_on_expiration   = var.integration == "pull" ? false : true
    close_violations_on_expiration = var.integration == "pull" ? false : true
  }
}

