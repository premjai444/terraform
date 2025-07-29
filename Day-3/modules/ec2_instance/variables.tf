variable "ami_value" {
    description = "The AMI ID to use for the instance"
    type        = string
}

variable "instance_type_value" {
    description = "The type of instance to create"
    type        = string
}

variable "subnet_id_value" {
    description = "The ID of the subnet in which to launch the instance"
    type        = string
}

