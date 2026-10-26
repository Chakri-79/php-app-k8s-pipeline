# Kubernetes Manifests — Blood Bank Application

## Overview

This directory contains the Kubernetes YAML manifests used to deploy, configure, secure, and manage the Blood Bank application on Amazon EKS.

The manifests cover application deployment, database management, service discovery, ingress routing, autoscaling, configuration management, resource governance, and network security.

These configurations were implemented and tested during the project. The EKS cluster has since been decommissioned, and the manifests are retained for documentation and future reference.

## Kubernetes Resources

The following table describes the manifests maintained in this directory.

| No. | Manifest File | Kubernetes Resource | Purpose |
|---:|---|---|---|
| 1 | `deployment.yml` | Deployment | Manages application pod replicas and rolling updates. |
| 2 | `app_svc.yml` | Service | Exposes the application pods internally within the cluster. |
| 3 | `db_svc.yml` | Service | Provides network access to the database workload. |
| 4 | `statefulset.yml` | StatefulSet | Manages the database workload with stable pod identity. |
| 5 | `configMap.yml` | ConfigMap | Stores non-sensitive application configuration. |
| 6 | `secret.yml` | Secret | Stores sensitive configuration values for Kubernetes workloads. |
| 7 | `ingress.yml` | Ingress | Defines HTTP/HTTPS routing rules for external application access. |
| 8 | `hpa.yml` | HorizontalPodAutoscaler | Configures automatic application replica scaling based on resource utilization. |
| 9 | `netpol.yml` | NetworkPolicy | Defines network traffic restrictions between selected workloads. |
| 10 | `pdb.yml` | PodDisruptionBudget | Helps maintain the required level of application availability during voluntary disruptions. |
| 11 | `resource_quota.yml` | ResourceQuota | Limits aggregate resource consumption within a namespace. |
| 12 | `index.html` | HTML file | Contains the HTML content used by the application or supporting web configuration. |

**Note:** The descriptions above reflect the expected purpose of each filename. The exact resource definitions and behavior depend on the contents of the corresponding files.

## Architecture and Resource Relationships

The manifests support the following logical application structure:

```text
                 Ingress
                    |
                    v
               App Service
                    |
                    v
             Application Pods
                    |
                    v
              Database Service
                    |
                    v
              MySQL StatefulSet
                    |
                    v
              Persistent Storage

Additional Kubernetes Resources:

- ConfigMap and Secret: Application configuration
- HPA: Application replica scaling
- NetworkPolicy: Network traffic control
- PodDisruptionBudget: Availability during voluntary disruptions
- ResourceQuota: Namespace resource governance
```

The architecture is a logical representation of the application components. Actual traffic flows and storage configuration depend on the individual manifests.

## Horizontal Pod Autoscaling

The `hpa.yml` manifest defines the Horizontal Pod Autoscaler configuration for the application.

HPA can adjust the number of application pod replicas based on configured metrics and scaling limits.

The configuration should be reviewed for:

- Target Deployment name
- Minimum and maximum replica counts
- CPU or memory utilization target
- Resource requests configured on application containers
- Availability of the Kubernetes metrics API

The original project included a three-replica deployment and a separate four-replica demonstration. These screenshots document the observed states and do not, by themselves, establish that HPA triggered the change.

## Configuration Management

### ConfigMap

The `configMap.yml` manifest defines non-sensitive configuration that can be supplied to application containers.

### Secret

The `secret.yml` manifest defines Kubernetes Secret resources for sensitive configuration.

**Security recommendation:** Do not commit real passwords, access tokens, database credentials, or other active secrets to a public repository. Kubernetes Secret values encoded in Base64 are not encrypted merely because they are encoded. Review the file and its Git history before sharing the repository.

## Networking and Security

### Ingress

The `ingress.yml` manifest defines rules for routing incoming HTTP or HTTPS traffic to the application.

Ingress functionality depends on an appropriate Ingress controller and its configuration.

### NetworkPolicy

The `netpol.yml` manifest defines network access restrictions for selected pods.

Its effectiveness depends on the configured selectors, ingress and egress rules, and support from the cluster's networking implementation.

## Availability and Resource Governance

### PodDisruptionBudget

The `pdb.yml` manifest defines availability constraints for voluntary disruptions, such as certain maintenance operations.

A PodDisruptionBudget does not prevent every possible pod failure or guarantee application availability.

### ResourceQuota

The `resource_quota.yml` manifest defines aggregate resource limits for a Kubernetes namespace.

Depending on its configuration, it can restrict resource requests, limits, pod counts, and other supported resource types.

## Database Management

The `statefulset.yml` manifest manages the database workload using StatefulSet semantics.

The `db_svc.yml` manifest provides network access to the database.

Review the database configuration and storage requirements before deploying these resources in another cluster.

## Deployment Instructions

The original EKS cluster has been decommissioned. The following commands are provided for future reference when a suitable Kubernetes environment is available.

First, inspect the manifests:

```bash
kubectl apply --dry-run=client -f .
```

Review the files and verify that they reference the correct namespace, container images, services, and storage resources before deploying them.

To apply the manifests individually, use the appropriate filename:

```bash
kubectl apply -f configMap.yml
kubectl apply -f secret.yml
kubectl apply -f statefulset.yml
kubectl apply -f db_svc.yml
kubectl apply -f deployment.yml
kubectl apply -f app_svc.yml
kubectl apply -f ingress.yml
kubectl apply -f hpa.yml
kubectl apply -f netpol.yml
kubectl apply -f pdb.yml
kubectl apply -f resource_quota.yml
```

Apply resources in an appropriate order for their dependencies. Confirm that referenced namespaces, storage resources, ingress controllers, and required metrics services exist.

The `index.html` file is not a Kubernetes manifest and should not be passed to `kubectl apply` unless it contains a valid Kubernetes resource definition.

## Verification Commands

After deploying the manifests in a suitable environment, use the following commands to inspect the resources:

```bash
kubectl get deployments
kubectl get pods
kubectl get services
kubectl get statefulsets
kubectl get ingress
kubectl get hpa
kubectl get networkpolicies
kubectl get pdb
kubectl get resourcequota
kubectl get configmaps
kubectl get secrets
```

Use `kubectl describe` and `kubectl logs` to investigate deployment or runtime issues.

## Current Project Status

The original Amazon EKS cluster and EC2 infrastructure have been deleted after the project implementation.

The Kubernetes manifests are preserved in this repository for technical reference, documentation, and future deployment in a suitable environment.

No currently running infrastructure is implied by the presence of these files.

## Author

**Chakradhar**

DevOps | AWS | Terraform | Jenkins | Docker | Kubernetes | Argo CD | Prometheus | Grafana
