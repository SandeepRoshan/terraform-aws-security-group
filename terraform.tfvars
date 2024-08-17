# A single allowed ingress traffic type
in_ingress = ["ssh"]

# A single allowed egress traffic type
in_egress = ["all-traffic"]

# The VPC ID under which the security group will be created
in_vpc_id = ""  # Replace with your VPC ID

# A single CIDR block allowed for ingress traffic
in_ingress_cidr_blocks = ["0.0.0.0/0"]

# A single CIDR block allowed for egress traffic
in_egress_cidr_blocks = ["0.0.0.0/0"]

# A single optional tag mandated by the organization
in_mandated_tags = {
  "Environment" = "dev"
}

# Creational stamp for the ecosystem instance
in_ecosystem = "my-ecosystem"

# Single timestamp for resource tags
in_timestamp = "240817-1530"

# Single description tag for the resources
in_description = "Created for the My-Ecosystem VPC network."

# Single additional tag timestamp (if different from in_timestamp)
in_tag_timestamp = "2408171530"  # Replace with actual timestamp if needed

# Single additional tag description (if different from in_description)
in_tag_description = "Security group for My-Ecosystem services."
