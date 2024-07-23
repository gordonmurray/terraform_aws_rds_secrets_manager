# AWS RDS with AWS Secrets Manager

An example to create an AWS RDS instance using MariaDB. Generate and store its admin password in AWS Secrets manager using Terraform. Also creates a Proxy to try it out.


### Cost
```
Project: gordonmurray/terraform_aws_rds_secrets_manager


 Name                                                             Monthly Qty  Unit                    Monthly Cost

 aws_db_instance.default
 ├─ Database instance (on-demand, Single-AZ, db.t4g.small)                730  hours                         $25.55
 ├─ Storage (general purpose SSD, gp3)                                     20  GB                             $2.54
 └─ Additional backup storage                               Monthly cost depends on usage: $0.095 per GB

 aws_kms_key.default
 ├─ Customer master key                                                     1  months                         $1.00
 ├─ Requests                                                Monthly cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests                        Monthly cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests                        Monthly cost depends on usage: $0.10 per 10k requests

 aws_secretsmanager_secret.example
 ├─ Secret                                                                  1  months                         $0.40
 └─ API requests                                            Monthly cost depends on usage: $0.05 per 10k requests

 OVERALL TOTAL                                                                                              $29.49

*Usage costs can be estimated by updating Infracost Cloud settings, see docs for other options.

──────────────────────────────────
9 cloud resources were detected:
∙ 3 were estimated
∙ 5 were free
∙ 1 is not supported yet, see https://infracost.io/requested-resources:
  ∙ 1 x aws_db_proxy

┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━━━┓
┃ Project                                            ┃ Baseline cost ┃ Usage cost* ┃ Total cost ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━╋━━━━━━━━━━━━┫
┃ main                                               ┃           $29 ┃           - ┃        $29 ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━┻━━━━━━━━━━━━┛
```