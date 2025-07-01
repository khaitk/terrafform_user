# Terraform AWS Project

## User Project

```
.
├── main.tf             
├── variables.tf         
├── outputs.tf          
├── terraform.tfvars     
└── modules/             
    ├── api_gateway/     # Module API Gateway
    ├── lambda/          # Module Lambda
    ├── s3/              # Module S3
    ├── sns/             # Module SNS
    ├── sqs/             # Module SQS
    └── cloudwatch/      # Module CloudWatch
```

## Req

- Terraform v1.0.0

## Use

1. Update file `terraform.tfvars` env.

2. Terraform Init:
```bash
terraform init
```

3. Check change:
```bash
terraform plan
```

4. Apply change:
```bash
terraform apply
```

5. Remove src:
```bash
terraform destroy
```
