variable "containers" {
  type = list(object({
    name = string
    port = number
  }))
  default = [
    {
      name = "jabba",
      port = 8001
    },
    {
      name = "fett",
      port = 8002
    }
  ]
}
