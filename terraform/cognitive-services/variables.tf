variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w]{1,60}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name must be between 1 and 60 characters, must only contain alphanumeric characters and hyphens, and cannot end with a hyphen."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "location" {
  type        = string
  description = "Location of the resource group."
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

variable "is_private_endpoint" {
  type        = bool
  description = "Whether private endpoints are enabled to access the resource."
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint."
  default     = ""
}

variable "kind" {
  type        = string
  description = "Specifies the type of Cognitive Service Account that should be created."
  validation {
    condition     = contains(["academic", "anomalydetector", "bing.autosuggest", "bing.autosuggest.v7", "bing.customsearch", "bing.search", "bing.search.v7", "bing.speech", "bing.spellcheck", "bing.spellcheck.v7", "cognitiveservices", "computervision", "contentmoderator", "customspeech", "customvision.prediction", "customvision.training", "emotion", "face", "formrecognizer", "immersivereader", "luis", "luis.authoring", "metricsadvisor", "openai", "personalizer", "qnamaker", "recommendations", "speakerrecognition", "speech", "speechservices", "speechtranslation", "textanalytics", "texttranslation", "weblm"], lower(var.kind))
    error_message = "Valid values for kind are \"Academic\", \"AnomalyDetector\", \"Bing.Autosuggest\", \"Bing.Autosuggest.v7\", \"Bing.CustomSearch\", \"Bing.Search\", \"Bing.Search.v7\", \"Bing.Speech\", \"Bing.SpellCheck\", \"Bing.SpellCheck.v7\", \"CognitiveServices\", \"ComputerVision\", \"ContentModerator\", \"CustomSpeech\", \"CustomVision.Prediction\", \"CustomVision.Training\", \"Emotion\", \"Face\", \"FormRecognizer\", \"ImmersiveReader\", \"LUIS\", \"LUIS.Authoring\", \"MetricsAdvisor\", \"OpenAI\", \"Personalizer\", \"QnAMaker\", \"Recommendations\", \"SpeakerRecognition\", \"Speech\", \"SpeechServices\", \"SpeechTranslation\", \"TextAnalytics\", \"TextTranslation\",  or \"WebLM\"."
  }
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this Cognitive Service Account."
  validation {
    condition     = contains(["f0", "f1", "s0", "s", "s1", "s2", "s3", "s4", "s5", "s6", "p0", "p1", "p2", "e0"], lower(var.sku_name))
    error_message = "Valid values for sku_name are \"f0\", \"f1\", \"s0\", \"s\", \"s1\", \"s2\", \"s3\", \"s4\", \"s5\", \"s6\", \"p0\", \"p1\", \"p2\", \"e0\"."
  }
  default = "S0"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for the Cognitive Account."
  default     = false
}

variable "outbound_network_access_restricted" {
  type        = bool
  description = "Whether outbound network access is restricted for the Cognitive Account."
  default     = true
}

variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include."
  default     = []
}