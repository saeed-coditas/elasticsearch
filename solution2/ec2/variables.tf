variable "regions" {
  type = map(any)
}
variable "product" {
  default = "elaticsearch"
}
variable "environment" {
  type = any
}