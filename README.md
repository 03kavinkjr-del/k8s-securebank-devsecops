# SecureBank Zero-Trust DevSecOps Platform

## Overview

SecureBank is a cloud-native DevSecOps platform built to demonstrate secure application deployment and infrastructure automation using Kubernetes, Terraform, Helm, Prometheus, and Grafana.

## Architecture

Developer
→ GitHub
→ GitHub Actions
→ Terraform
→ Kubernetes
→ Helm
→ SecureBank API
→ Prometheus
→ Grafana

## Technologies Used

* Docker
* Kubernetes (Minikube)
* Terraform
* Helm
* Prometheus
* Grafana
* GitHub Actions
* Trivy
* Checkov
* Semgrep
* Gitleaks

## Security Controls

* RBAC
* Kubernetes Network Policies
* Non-root Containers
* Vulnerability Scanning
* Infrastructure as Code Validation

## Project Structure

app/
terraform/
kubernetes/
helm/
monitoring/
security/
.github/workflows/

## Monitoring

* Prometheus Metrics Collection
* Grafana Dashboards

## Future Enhancements

* ArgoCD GitOps
* Ingress Controller
* TLS Certificates
* Loki Logging Stack
* Kubernetes Secrets Management
