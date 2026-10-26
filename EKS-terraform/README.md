# AWS EKS Infrastructure — Terraform

## Overview

This directory contains the Terraform configuration used to provision AWS infrastructure for the Blood Bank DevOps project.

The configuration was used during the original implementation of the Amazon EKS environment.

The infrastructure has since been decommissioned. The configuration is retained for reference and portfolio documentation.

## Purpose

* Define cloud infrastructure as code.
* Maintain reusable Terraform configuration.
* Document the infrastructure provisioning workflow.
* Support infrastructure review and future reproduction.

## Configuration Contents

Review the existing Terraform files to identify the resources and variables they define.

Do not assume that a particular AWS resource is provisioned unless it is present in the configuration.

## Terraform Workflow

From the directory containing the Terraform configuration, the typical workflow is:

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Review the plan before provisioning any infrastructure.

Running `terraform apply` can create billable AWS resources. Do not execute it unless you intend to recreate the infrastructure and have reviewed the associated costs and configuration.

## Security

* Do not commit AWS credentials or private SSH keys.
* Do not commit Terraform state files or state backups.
* Exclude generated `.terraform/` contents.
* Retain `.terraform.lock.hcl` when it is present and appropriate.
* Configure backend credentials securely.

## Current Status

The AWS infrastructure used during the project has been deleted. This directory contains the Terraform configuration retained for reference.
