[![tfsec](https://github.com/gordonmurray/terraform_aws_rds_secrets_manager/actions/workflows/tfsec-analysis.yml/badge.svg)](https://github.com/gordonmurray/terraform_aws_rds_secrets_manager/actions/workflows/tfsec-analysis.yml)

# AWS RDS with AWS Secrets Manager

A simple example to show how to create an AWS RDS instance, generate and store its admin password in AWS Secrets manager using Terraform.


### Cost
```
Project: gordonmurray/terraform_aws_rds_secrets_manager

 Name                                                            Monthly Qty  Unit                    Monthly Cost 
                                                                                                                   
 aws_db_instance.default                                                                                           
 ├─ Database instance (reserved, Single-AZ, db.t4g.small)                730  hours                         $16.64 
 ├─ Storage (general purpose SSD, gp2)                                    20  GB                             $2.54 
 └─ Additional backup storage                              Monthly cost depends on usage: $0.095 per GB            
                                                                                                                   
 aws_kms_key.default                                                                                               
 ├─ Customer master key                                                    1  months                         $1.00 
 ├─ Requests                                               Monthly cost depends on usage: $0.03 per 10k requests   
 ├─ ECC GenerateDataKeyPair requests                       Monthly cost depends on usage: $0.10 per 10k requests   
 └─ RSA GenerateDataKeyPair requests                       Monthly cost depends on usage: $0.10 per 10k requests   
                                                                                                                   
 aws_secretsmanager_secret.example                                                                                 
 ├─ Secret                                                                 1  months                         $0.40 
 └─ API requests                                           Monthly cost depends on usage: $0.05 per 10k requests   
                                                                                                                   
 OVERALL TOTAL                                                                                            $20.58 
──────────────────────────────────
4 cloud resources were detected:
∙ 3 were estimated, 2 of which include usage-based costs, see https://infracost.io/usage-file
∙ 1 was free:
  ∙ 1 x aws_secretsmanager_secret_version
```

Estimate cost generated using [Infracost](https://github.com/Infracost/infracost) 
