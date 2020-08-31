# AWS RDS with AWS Secrets Manager

A simple example to show how to create an AWS RDS instance, generate and store its admin password in AWS Secrets manager using Terraform.


### Cost
```
  NAME                             QUANTITY  UNIT      HOURLY COST  MONTHLY COST  

  aws_db_instance.default                              
  ├─ GB                                  20  GB/month       0.0035        2.5400  
  └─ instance hours (db.t2.micro)       730  hour           0.0180       13.1400  
  Total                                                     0.0215       15.6800  
                                                       
  OVERALL TOTAL                                             0.0215       15.6800  

```

Estimate cost generated using [Infracost](https://github.com/aliscott/infracost)