# rai-aws-resources

AWS infrastructure resources managed with Terraform.

## Modules

### `elastic-ip/`

Allocates an Elastic IP and associates it with the RAI EC2 instance (`i-0aa0c1e19392592dc`, `us-east-1`).

> **Cost Warning**
> - EIP is **free** while associated with a **running** instance
> - EIP costs **~$0.005/hr (~$3.60/mo)** when the instance is **stopped**
> - EIP costs **~$0.005/hr** if allocated but **unassociated**
> - Run `terraform destroy` to release the EIP when it is no longer needed

#### Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5
- AWS credentials (this EC2 uses the `ec2fulladmin` IAM role — no extra config needed)

#### Usage

```bash
cd elastic-ip

# First time only
terraform init

# Review what will be created
terraform plan

# Apply — this will allocate an EIP and associate it (~$0 while running)
terraform apply

# See the assigned IP and DNS
terraform output
```

#### Destroy (release EIP)

```bash
cd elastic-ip
terraform destroy
```

> Run `terraform destroy` before terminating the instance to avoid orphaned EIP charges.
