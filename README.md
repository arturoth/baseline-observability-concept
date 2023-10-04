# Component: `baseline-observability-concept`

This component is responsible for creating monitoring resources for New Relic in base of an created AWS resource

## Usage

**Stack Level**: Regional

Here's an example snippet for how to use this component.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 0.14 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | >= 3.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | >= 3.20 |


## Resources

No resources.

### Newrelic

| Name | Description |
|------|---------|
| TF_VAR_NEW_RELIC_ACCOUNT | An id for new relic account |
| TF_VAR_NEW_RELIC_API_KEY | An NRAK key for New Relic |
| TF_VAR_NEW_RELIC_LICENSE_KEY | An NRAL License for New Relic |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="violation_time_limit_seconds"></a> [violation\_time\_limit\_seconds](#violation\_time\_limit\_seconds) | Time limit, in seconds, that will automatically force-close a long-lasting incident after the time limit you select | `number` | 3600 | no |
| <a name="integration"></a> [integration](#integration) | This variable enables to change minimal validation time if integration is pull (5m) or push (1m). | `string` | pull | no |
