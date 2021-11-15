[![tfsec](https://github.com/gordonmurray/terraform_aws_rds_secrets_manager/actions/workflows/tfsec-analysis.yml/badge.svg)](https://github.com/gordonmurray/terraform_aws_rds_secrets_manager/actions/workflows/tfsec-analysis.yml)

# AWS RDS with AWS Secrets Manager

A simple example to show how to create an AWS RDS instance, generate and store its admin password in AWS Secrets manager using Terraform.


### Cost
```
 Name                                                            Monthly Qty  Unit                    Monthly Cost

 aws_db_instance.default
 ├─ Database instance (on-demand, Single-AZ, db.t3.micro)                730  hours                         $13.14
 └─ Storage (general purpose SSD, gp2)                                    20  GB                             $2.54

 aws_kms_key.default
 ├─ Customer master key                                                    1  months                         $1.00
 ├─ Requests                                               Monthly cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests                       Monthly cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests                       Monthly cost depends on usage: $0.10 per 10k requests

 aws_secretsmanager_secret.example
 ├─ Secret                                                                 1  months                         $0.40
 └─ API requests                                           Monthly cost depends on usage: $0.05 per 10k requests

 OVERALL TOTAL                                                                                              $17.08
```

Estimate cost generated using [Infracost](https://github.com/Infracost/infracost)