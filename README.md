# 🛠️ Terraform AWS Infrastructure Provisioning

This repository contains Terraform configurations for provisioning essential AWS infrastructure. The configurations are designed to create foundational resources, facilitating the deployment of cloud-based applications in a controlled and scalable environment.


---

## 📖 Overview

The Terraform scripts in this repository provision the following AWS resources:  

- **VPC (Virtual Private Cloud):** Provides an isolated network environment.  
- **Subnet:** Allocates IP ranges within the VPC for resource deployment.  
- **Internet Gateway:** Enables internet access for the VPC.  
- **Route Table:** Configures routing to direct traffic to the internet gateway.  
- **Security Group:** Manages inbound and outbound traffic rules, allowing HTTP and SSH access.  
- **EC2 Instance:** Launches a basic virtual machine with public internet access.

These configurations are simple and can serve as a starting point for more advanced AWS infrastructure setups.


---


## 📝 Prerequisites

To use the configurations in this repository, ensure the following prerequisites are met:  

1. **Terraform:** Install the latest version of [Terraform](https://www.terraform.io/downloads.html).  
2. **AWS Account:** Have an AWS account with sufficient IAM permissions to provision the described resources.  
3. **AWS CLI:** Configure the [AWS CLI](https://aws.amazon.com/cli/) with appropriate credentials.  
4. **SSH Key Pair:** Generate or use an existing SSH key pair to access the EC2 instance.


---

## 📋 Instructions

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
https://github.com/Hatsuhinode/AWS_Infra_Configs_with_Terraform.git
cd AWS_Infra_Configs_with_Terraform
```


### 2. Initialize Terraform
Run the following command to initialize Terraform and download required providers:

```bash
terraform init
```


### 3. Customize Variables
Edit the `variables.tf` file to customize the resource configurations. Default values are provided, but you can override them based on your requirements.


### 4. Apply Configuration
To create the infrastructure, execute:

```bash
terraform apply
```

Review the planned changes, and type yes to confirm and provision the resources.


### 5. Access Resources
Once applied, the EC2 instance's public IP will be available in the Terraform output. Use your SSH key to connect:
```bash
ssh -i /path/to/your/private/key.pem ubuntu@<ec2-public-ip>
```


### 6. Destroy Infrastructure
To delete all resources created by Terraform:

```bash
terraform destroy
```

Confirm the operation by typing yes.

---

## ⚙️ Configuration Variables

| Variable Name              | Description                                               | Example Value       |
|----------------------------|-----------------------------------------------------------|---------------------|
| `aws_region`               | AWS region for resource provisioning                      | `eu-north-1`        |
| `myvpc_cidr`               | CIDR block for the VPC                                    | `10.0.0.0/16`       |
| `myvpc_name`               | Name of the VPC                                           | `MyVPC1`            |
| `mysubnet_cidr`            | CIDR block for the subnet                                 | `10.0.0.0/24`       |
| `mysubnet_availabilityZone`| Availability zone for the subnet                          | `eu-north-1a`       |
| `mysubnet_name`            | Name of the subnet                                        | `MySubnet1`         |
| `igw_name`                 | Name of the internet gateway                              | `MyIGW1`            |
| `destination_cidr`         | CIDR block for routing internet traffic                   | `0.0.0.0/0`         |
| `ami_type`                 | AMI ID for the EC2 instance                               | `ami-0705384c0b33c194c` |
| `ec2Instance_type`         | Instance type for the EC2 instance                        | `t3.micro`          |


---


## 🚀 Key Features

- Designed for beginners to practice and understand Terraform basics.
- Modular and customizable Terraform configuration.  
- Secure EC2 instance access via SSH and configurable security groups.  
- Simplified network architecture suitable for learning or small-scale deployments.
- Includes a VPC, Subnet, Internet Gateway, and Route Table, ensuring a basic yet functional architecture.  
