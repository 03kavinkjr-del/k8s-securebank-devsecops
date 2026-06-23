# SecureBank DevSecOps Pipeline

## Overview

SecureBank is an end-to-end DevSecOps project demonstrating secure software delivery using modern cloud-native security practices.

The project integrates automated security scanning, Infrastructure as Code (IaC), container security, Kubernetes hardening, monitoring, and CI/CD automation.

## Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions CI/CD
    |
    +--> Gitleaks (Secrets Scanning)
    |
    +--> Semgrep (SAST)
    |
    +--> Checkov (IaC Security)
    |
    +--> Trivy (Vulnerability Scanning)
    |
    +--> Terraform Validation
    |
    v
Kubernetes Cluster
    |
    +--> SecureBank Application
    |
    +--> Network Policies
    |
    +--> RBAC
    |
    v
Prometheus
    |
    v
Grafana Dashboard
```

---

## Technologies Used

### CI/CD

* GitHub Actions

### Security Tools

* Gitleaks
* Semgrep
* Trivy
* Checkov

### Containerization

* Docker

### Infrastructure as Code

* Terraform

### Container Orchestration

* Kubernetes
* Helm

### Monitoring & Observability

* Prometheus
* Grafana

---

## Security Controls Implemented

### Docker Security

* Non-root user execution
* Docker HEALTHCHECK
* Minimal base image
* Read-only filesystem

### Kubernetes Security

* Run as non-root user
* RuntimeDefault seccomp profile
* Disabled service account token mounting
* Resource limits and requests
* Liveness and readiness probes
* Dropped Linux capabilities
* Network Policies

### Terraform Security

* Secure Service Accounts
* RBAC configuration
* Kubernetes Network Policies
* Secure Deployment configuration

### CI/CD Security

* Secret scanning with Gitleaks
* Static code analysis with Semgrep
* IaC security scanning with Checkov
* Vulnerability scanning with Trivy
* Terraform validation

---

## Project Structure

```text
k8s-securebank-devsecops
│
├── app/
│   └── backend/
│       ├── app.py
│       ├── Dockerfile
│       └── requirements.txt
│
├── kubernetes/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   └── networkpolicy.yaml
│
├── terraform/
│   ├── main.tf
│   ├── deployment.tf
│   ├── service.tf
│   ├── networkpolicy.tf
│   └── rbac.tf
│
├── helm/
│   └── securebank/
│
└── .github/
    └── workflows/
        └── security-pipeline.yml
```

---

## Running the Project

### Build Docker Image

```bash
docker build -t securebank-api:v1 app/backend
```

### Deploy Kubernetes Resources

```bash
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl apply -f kubernetes/networkpolicy.yaml
```

### Verify Deployment

```bash
kubectl get pods -n securebank
kubectl get svc -n securebank
```

---

## Monitoring

### Prometheus

```bash
kubectl port-forward svc/prometheus-server 9090:80
```

Open:

```text
http://localhost:9090
```

### Grafana

```bash
kubectl port-forward svc/grafana 3000:80
```

Open:

```text
http://localhost:3000
```

---

## CI/CD Pipeline

The GitHub Actions pipeline automatically performs:

1. Source code checkout
2. Secret scanning (Gitleaks)
3. Static Application Security Testing (Semgrep)
4. Infrastructure Security Scanning (Checkov)
5. Vulnerability Scanning (Trivy)
6. Terraform Validation

Any security violations cause the pipeline to fail.

---

## Security Scan Results

* Docker Security Checks: Passed
* Kubernetes Security Checks: Passed
* Terraform Security Checks: Passed
* Helm Security Checks: Passed
* GitHub Actions Security Checks: Passed

---

## Author

Kavin 

M.Sc Cyber Security

DevSecOps | Cloud Security | Kubernetes Security
