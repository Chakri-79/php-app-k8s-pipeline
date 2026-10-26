# End-to-End DevOps Implementation for a Blood Bank Application

## Project Overview

This project demonstrates the implementation of an end-to-end DevOps workflow for a Blood Bank web application using AWS, Jenkins, Docker, Kubernetes, Terraform, Argo CD, Prometheus, Grafana, and Slack.

The objective was to automate application delivery, provision cloud infrastructure using Infrastructure as Code, deploy application workloads on Amazon EKS, demonstrate horizontal pod autoscaling, and configure monitoring and alert notifications.

The repository contains the application source code, Terraform configuration, Kubernetes manifests, alert configuration, and screenshots documenting the implementation.


## Technology Stack

| Category                | Technologies                         |
| ----------------------- | ------------------------------------ |
| Cloud Platform          | AWS                                  |
| Infrastructure as Code  | Terraform                            |
| CI/CD                   | Jenkins                              |
| Code Quality            | SonarQube                            |
| Containerization        | Docker                               |
| Container Registry      | Docker Hub                           |
| Container Orchestration | Kubernetes, Amazon EKS               |
| GitOps                  | Argo CD                              |
| Autoscaling             | Kubernetes Horizontal Pod Autoscaler |
| Monitoring              | Prometheus, Grafana                  |
| Monitoring Installation | Helm                                 |
| Notifications           | Slack                                |
| Application             | PHP, MySQL                           |

## Project Architecture

The following diagram represents the major components and intended workflow used in the project.

```text
                 Developer
                     |
                     v
               GitHub Repository
                     |
                     v
                  Jenkins
                     |
          +----------+----------+
          |          |          |
          v          v          v
      SonarQube    Docker      Trivy
      Analysis     Build       Scan
                     |
                     v
                 Docker Hub
                     |
                     v
              Amazon EKS Cluster
                     |
          +----------+----------+
          |          |          |
          v          v          v
      PHP App      MySQL       HPA
          |
          v
       Argo CD
    GitOps Deployment

     Monitoring and Alerting
                     |
                     v
              Prometheus
                     |
                     v
                 Grafana
                     |
                     v
                  Slack
```

*Note: This is a conceptual overview. Individual integrations and connections should be interpreted according to the actual configuration and evidence available in this repository.*

## Key Project Components

### 1. Infrastructure Provisioning

Terraform configuration was used to provision AWS infrastructure for the project, including the Amazon EKS environment.

The Terraform configuration is available in the `Eks-terraform/` directory.

### 2. CI/CD Pipeline

Jenkins was used to implement the application delivery workflow.

The pipeline included the following stages where implemented:

* Source code checkout
* Code quality analysis using SonarQube
* Docker image building
* Container image vulnerability scanning using Trivy
* Image publishing to Docker Hub

### 3. Kubernetes Deployment

The application and its supporting components were deployed to Kubernetes using the existing manifests in `manifest_files/`.

The deployment included the PHP application, MySQL database, Kubernetes networking resources, and supporting configurations.

### 4. GitOps with Argo CD

Argo CD was used to manage the Kubernetes application's desired state through Git-based configuration.

The screenshots document the application and its Kubernetes resources as observed during implementation.

### 5. Horizontal Pod Autoscaling

Kubernetes HPA was configured to demonstrate application replica scaling.

The screenshots include the original three-replica deployment and a four-replica example associated with the autoscaling exercise.

### 6. Monitoring and Alerting

Prometheus and Grafana were installed using Helm for monitoring.

Grafana was used to visualize monitoring data, and Slack alert configuration was maintained in the repository.

Refer to `alerts-config.yml` for the existing alert configuration.





## Challenges and Learnings

The project provided practical experience with:

* Provisioning cloud infrastructure using Terraform.
* Integrating code quality analysis into a Jenkins pipeline.
* Building and publishing container images.
* Deploying application workloads on Kubernetes.
* Managing Kubernetes applications through Argo CD.
* Configuring HPA and understanding replica scaling.
* Installing monitoring components using Helm.
* Configuring monitoring dashboards and alert notifications.
* Troubleshooting deployment, autoscaling, and repository issues.
* Managing infrastructure cleanup after completing the implementation.


## Security Considerations

* Do not commit AWS credentials, GitHub tokens, database passwords, or active Slack webhook URLs.
* Keep Terraform state files and generated provider binaries out of the repository.
* Store sensitive configuration securely.
* Review existing Git history if credentials were previously committed.

## Author

**Chakradhar**

DevOps | AWS | Terraform | Jenkins | Docker | Kubernetes | GitOps | Monitoring
