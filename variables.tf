variable "violation_time_limit_seconds" {
  type        = number
  default     = 3600
  description = "Time limit, in seconds, that will automatically force-close a long-lasting incident after the time limit you select"
}

variable "integration" {
  type        = string
  default     = "pull"
  description = "This variable enables to change minimal validation time if integration is pull (5m) or push (1m)."
}

