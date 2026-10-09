# Prometheus and Grafana Monitoring

## Overview

This directory documents the monitoring setup for the `devops-lab-01` Kubernetes environment using Helm.

The monitoring stack is deployed using the `kube-prometheus-stack` Helm chart from the Prometheus Community repository.

### Components

* **Prometheus** — Collects and stores metrics from Kubernetes and supported monitoring targets.
* **Grafana** — Visualizes metrics through dashboards using Prometheus as a data source.
* **Alertmanager** — Handles alerts generated from configured Prometheus alerting rules.
* **Node Exporter** — Exposes host-level metrics where supported by the deployment.
* **Kube State Metrics** — Exposes metrics about Kubernetes objects and their states.

## Prerequisites

* Docker
* Kubernetes Kind cluster named `devops-lab-01`
* `kubectl`
* Helm

Verify that the cluster is available:

```bash
kubectl cluster-info
kubectl get nodes
```

## Installation

Add the Prometheus Community Helm repository and update the repository index:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

Install the monitoring stack in a dedicated namespace:

```bash
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace
```

Check the deployed resources:

```bash
kubectl get pods -n monitoring
kubectl get services -n monitoring
helm list -n monitoring
```

Wait until the relevant pods are ready before accessing the dashboards.

## Accessing Grafana

Forward the Grafana service to local port `3000`:

```bash
kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80
```

Open the following URL in a browser:

```text
http://localhost:3000
```

The default username for this chart is usually `admin`.

Retrieve the generated admin password:

```bash
kubectl get secret -n monitoring monitoring-grafana \
  -o jsonpath='{.data.admin-password}' | base64 -d
echo
```

Keep the port-forward process running while accessing Grafana.

## Accessing Prometheus

Forward the Prometheus service to local port `9090`:

```bash
kubectl port-forward -n monitoring svc/monitoring-kube-prometheus-prometheus 9090:9090
```

Open:

```text
http://localhost:9090
```

Use the Prometheus interface to inspect available metrics and execute PromQL queries.

## Verification and Troubleshooting

Check pod status:

```bash
kubectl get pods -n monitoring
```

Inspect a pod that is not ready:

```bash
kubectl describe pod -n monitoring <pod-name>
kubectl logs -n monitoring <pod-name> --tail=100
```

Check available services:

```bash
kubectl get services -n monitoring
```

If a service name differs from the examples, use the name returned by this command.

## Cleanup

To remove the monitoring release:

```bash
helm uninstall monitoring -n monitoring
```

To remove the namespace and its remaining namespaced resources:

```bash
kubectl delete namespace monitoring
```

**Warning:** Deleting the namespace removes its namespaced resources and may delete monitoring data stored there. This operation does not delete the Kind cluster itself.

## Current Scope and Future Improvements

The initial setup provides a monitoring stack for Kubernetes and supported targets.

Potential improvements include:

* Configure Spring Boot Actuator and Micrometer to expose application metrics.
* Configure Prometheus to scrape the Customers Service metrics endpoint.
* Create Grafana dashboards for application health, request latency, and error rates.
* Configure alerting rules for application and infrastructure issues.
* Document resource requirements and persistent storage for longer-running environments.

## Notes

This setup is intended for local development and learning with Kind. It is not a production-ready monitoring deployment without additional security, resource planning, persistence, and access-control configuration.
