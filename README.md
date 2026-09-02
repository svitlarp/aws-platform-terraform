# aws-platform-terraform

Table of contents 
+ About the Project [--->](#about-the-project)
+ Project Structure [--->](#project-structure)
+ Architecture Diagram [--->](#architecture-diagram)
+ Quick Start [--->](#quick-start)
+ Usage [--->](#usage)
+ Remote State Management [--->](#remote-state-management)
+ Cost Management [--->](#cost-management)
+ Troubleshooting [--->](#troubleshooting)

## About the Project
Terraform infrastructure automation for AWS: VPC, ECR, S3, EKS.    
Dev and prod environments with remote state management and troubleshooting documentation.

#### AWS Resources Created by This Code

**VPC** 
- 1 VPC with configurable CIDR block
```
10.0.0.0/16   dev 
10.1.0.0/16   prod
10.2.0.0/16   staging (reserved)
10.3.0.0/16   shared  (reserved)
```
- 3 public subnets (across 3 Availability Zones)
- 3 private subnets (across 3 Availability Zones)
- 1 Internet Gateway (IGW) for public subnet routing
- 3 NAT Gateways with 3 Elastic IPs for private subnet egress
- Route tables (public and private) with appropriate associations
- 2 Security Groups (ALB, EKS)

**ECR**
- 1 private ECR repository for application container images

**S3**    
S3 backend with DynamoDB locking table for team collaboration 
- 1 S3 bucket for Terraform remote state (versioning + encryption enabled)
- 1 DynamoDB table for state locking

**EKS**
- 1 EKS cluster with API authentication mode
- 1 managed node group deployed across 3 private subnets
- 2 IAM roles (cluster control plane, worker nodes)
- Private and public API server endpoint access

> ! IMPORTANT
> Provisioning this infrastructure will create AWS resources that generate costs. Always destroy unused resources and monitor usage through AWS Billing, Budgets, and Cost Explorer to prevent unexpected charges.


### Quick Start

**Prerequisites**
```
terraform >= 1.2
aws-cli >= 2.0
```

**Deploy**

1. Clone the repo:
```
git clone https://github.com/your-username/aws-platform-terraform.git
cd aws-platform-terraform
```

2. Initialize Terraform (creates S3 and DynamoDB if needed):
```
cd terraform/environments/dev
terraform init
```

3. Plan and review changes:

```
terraform plan -out=tfplan
```

4. Apply:
```
terraform apply tfplan
```

5. Destroy (for dev/testing)
```
terraform destroy
```

### Usage


### Remote State Management

Terraform uses an S3 bucket to store state and a DynamoDB table for state locking; both must be created before initializing the backend.

### Cost Management

Provisioning this infrastructure will create AWS resources that generate costs. Always destroy unused resources to avoid unnecessary charges..

To monitor AWS resources, use AWS Cost Explorer to be aware of the price for every resource. 
You can also configure AWS Budgets, to set spending limits and receive notifications when thresholds are exceeded to prevent unexpected charges.


### Troubleshooting

