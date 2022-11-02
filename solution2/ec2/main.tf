# Creating EIP
# resource "aws_eip" "es_eip" {
#   instance = module.ec2_instance.id
#   vpc      = true
# }

# Creating elasticsearch server
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name                   = "${local.environment}-${var.product}-server"
  ami                    = local.instance_conf.ami_id
  instance_type          = local.instance_conf.instance_type
  key_name               = module.key_pair.key_pair_name
  monitoring             = true
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = data.terraform_remote_state.vpc.outputs.vpc_details.public_subnets.0
  ###user_data              = filebase64("./userdata.sh")
  iam_instance_profile = "${aws_iam_instance_profile.elasticsearchrole.name}"
  associate_public_ip_address = true

  depends_on             = [module.key_pair]
  tags                   = local.tags
}


# Creating Security Group
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name        = "${local.environment}-${var.product}-sg"
  description = "Security group for elasticsearch"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_details.vpc_id
  tags        = local.tags

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 0
      to_port     = 0
      protocol    = "icmp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 9300
      to_port     = 9300
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 9200
      to_port     = 9200
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

# Creating Keypair
module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name              = "${local.environment}-${var.product}-keypair"
  create_private_key    = true
  private_key_algorithm = "RSA"
  private_key_rsa_bits  = 4096
}

# Save Key to S3
resource "aws_s3_object" "this" {
  key      = local.key_name
  bucket   = local.storage_bucket_name
  content  = module.key_pair.private_key_pem
  metadata = {}
}

# IAM Role & Policy Attachment
resource "aws_iam_instance_profile" "elasticsearchrole" {
  name = "elasticsearchrole"
  role = "${aws_iam_role.elasticsearchrole.name}"
}

resource "aws_iam_role" "elasticsearchrole" {
  name = "es-s3-role"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            }
        }
    ]
}
POLICY
}

resource "aws_iam_policy" "iam_policy" {
  name = "elasticsearch-iam-policy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "ec2-s3-role" {
  role = "${aws_iam_role.elasticsearchrole.name}"
  policy_arn = "${aws_iam_policy.iam_policy.arn}"
}