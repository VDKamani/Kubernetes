# Kubernetes Documentation

This repository contains Kubernetes configurations, tasks, and examples categorized into different sections. Use this as a reference to explore Kubernetes features and best practices.

## Folder Structure

### Demo Files
These are demonstration files showcasing various Kubernetes concepts and configurations:

- **Daemonset**: Examples of DaemonSet configurations.
- **Default-kubeschschedular**: Configurations for default Kubernetes scheduler.
- **Deployment**: Deployment examples and configurations.
- **Namespace**: Namespace-specific Kubernetes configurations.
- **Node-selectors & Node Affinity**: Examples of node selectors and affinity/anti-affinity rules.
- **Nodebind**: Configurations related to node binding.
- **PODS**: Pod-level configurations and examples.
- **Replicaset**: Examples of ReplicaSet configurations.
- **Resource-quota**: Examples of resource quota configurations.
- **Service**: Service-related configurations.

### Tasks
These folders contain task-based Kubernetes examples and configurations:

- **Cross-Service-Connection**: Configurations for connecting services across namespaces.
- **Front-back-deployment.yml**: Examples of front-end and back-end deployments.
- **Load-balancing-Dep**: Load-balancing deployment configurations.
- **Task: Node-selection**: Task for node selection based on labels, taints, and tolerations.
- **Simple-Taint-Tollaration-example**: Task to add taints to nodes and ensure pods can tolerate them.
- **Custome-scheduling-task**: Task to schedule deployments with pod and node affinity.
- **Resource-limit-Task**: Task to understand the resource limit
- **WP-Deploy-Statefull**: Task to deploy wordpress setup where the database should be statefull set.
- **wordpress-project-deployment**: Task To Deploy existing project on to the K8s cluster.

### Steps

1. **Add a taint to a node:**
   ```bash
   kubectl taint node node02 env=prod:NoSchedule
   ```

2. **Add a label to the node:**
   ```bash
   kubectl label node node02 env=prod
   ```

3. **Create the deployment:**
   Apply the `taint-tollaration.yml` file to create the deployment:
   ```bash
   kubectl create -f taint-tollaration.yml
   ```

4. **Verify the pod is running on the tainted node:**
   ```bash
   kubectl get pods -o wide
   ```

## How to Use
1. Navigate to the relevant section to explore configurations or tasks.
2. Apply YAML files using `kubectl apply -f <file-name>`.
3. Follow instructions in individual task README files for specific guidance.

Feel free to contribute or raise issues if you find any gaps in the documentation.
