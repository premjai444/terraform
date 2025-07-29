provider "aws" {
    region = "ap-south-1"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami_value = ""
    instance_type_value = ""
    subnet_id_value = ""
}


// here we are using the module to create an EC2 instance, we need to supply the required variables
// since the module needs the specific variable values, so whenever we are using this module, we need to pass the values.     
