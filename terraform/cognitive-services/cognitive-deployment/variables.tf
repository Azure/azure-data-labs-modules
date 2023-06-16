variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{1,60}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name must be between 1 and 60 characters, must only contain alphanumeric characters and hyphens, and cannot end with a hyphen."
  }
}

variable "cognitive_account_id" {
  type        = string
  description = "The ID of the Cognitive Services Account. Changing this forces a new resource to be created."
}

variable "model_format" {
  type        = string
  description = "The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is OpenAI."
  validation {
    condition     = contains(["openai"], lower(var.model_format))
    error_message = "Valid values for model_format is \"OpenAI\"."
  }
  default = "OpenAI"
}

variable "model_name" {
  type        = string
  description = "The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created."
}

variable "model_version" {
  type        = string
  description = "The version of Cognitive Services Account Deployment model."
}

variable "scale_type" {
  type        = string
  description = "TDeployment scale type. Possible value is Standard. Changing this forces a new resource to be created."
  validation {
    condition     = contains(["standard"], lower(var.scale_type))
    error_message = "Valid values for scale_type is \"Standard\"."
  }
  default = "Standard"
}

variable "rai_policy_name" {
  type        = string
  description = "The name of RAI policy. Changing this forces a new resource to be created."
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}