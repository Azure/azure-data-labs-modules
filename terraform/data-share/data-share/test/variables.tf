resource "random_string" "postfix" {
  length  = 8
  special = false
  upper   = false
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "snapshot_schedule" {
  type = map(
    object(
      {
        name       = optional(string)
        recurrence = optional(string)
        start_time = optional(string)
      }
    )
  )
  default = {
    snap_sched = {
      name       = "example-ss"
      recurrence = "Day"
      start_time = "2020-04-17T04:47:52.9614956Z"
    }
  }
}
