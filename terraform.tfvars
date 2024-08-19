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
 rules = {
        "ssh"         = [ "22", "22", "tcp", "secure shell" ]
        "https"       = [ "443", "443", "tcp",   "http secured" ]
        "http"        = [ "80",  "80", "tcp", "http plaintext" ]//
        "all-traffic" = [ "-1", "-1",    "-1",   "All protocols" ]
        "ecs"         = [ "32768", "61000", "tcp",   "cluster comms" ]
        "docker"      = [ "5000",   "5000", "tcp", "docker registry" ]
        "java"        = [ "8080", "8080", "tcp", "java port"     ]
        "jenkins"     = [ "8080", "8080", "tcp", "jenkins ci"    ]
        "sonar"       = [ "9000", "9000", "tcp", "sonarqube metrics" ]
        "rmq-admin"   = [ "15672",  "15672", "tcp", "rabbitmq admin cli" ]
        "postgres"    = [ "5432",  "5432", "tcp",  "postgresql db" ]
    }

    in_sg_count = 3