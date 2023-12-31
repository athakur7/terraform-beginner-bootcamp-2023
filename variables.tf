variable "teacherseat_uuid" {
  type = string
}
variable "terratowns_access_token" {
  type = string
}
variable "terratowns_endpoint" {
  type = string
}

variable "gta" {
  type = object({
    public_path     = string
    content_version = number
  })
}

variable "payday" {
  type = object({
    public_path     = string
    content_version = number
  })
}