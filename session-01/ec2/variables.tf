variable "sg-name" {
  type        = string
  default     = "roboshop-all-aws"
  description = "description"
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "inbound-port" {
    #type = string
    default = 0
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}
