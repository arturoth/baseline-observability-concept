terraform {
  required_version = "> 0.14"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

provider "newrelic" {
  account_id = var.NEW_RELIC_ACCOUNT
  api_key    = var.NEW_RELIC_API_KEY
}

