# Node Affinity, Taints, and Tolerations Task

## Objective
In this task, we will utilize Kubernetes features such as:
- **NodeSelector**
- **Taints and Tolerations**
- **Node Affinity and Anti-Affinity**

We will create two deployments, each with 2 replicas:
- **Dev Stage**
  - Deployed on nodes labeled `env=dev`
- **Stage**
  - Deployed on nodes that **do not** have the label `env=prod`
- **Prod**
  - Deployed on nodes with taints `envType=prod:NoSchedule`

## Prerequisites
- A Kubernetes cluster with at least 3 nodes (node01, node02, node03).
- kubectl CLI configured to access the cluster.

## Steps

### Step 1: Add Labels to Nodes
Assign labels to the nodes to determine where deployments will be scheduled.

```bash
# Add env=dev label to node01
kubectl label node node01 env=dev

# Add env=prod label to node02
kubectl label node node02 env=prod
```

### Step 2: Add Taints to Nodes
Apply taints to nodes to control where workloads can be scheduled.

```bash
# Add taint to node02
kubectl taint node node02 env=prod:NoSchedule
```

### Step 3: (Optional) Add Roles to Nodes
For easier identification, assign roles to nodes.

```bash
kubectl label nodes node01 node-role.kubernetes.io/dev=dev
kubectl label nodes node02 node-role.kubernetes.io/prod=prod
kubectl label nodes node03 node-role.kubernetes.io/stage=stage
```

### Step 4: Apply Deployment Configuration
Create the necessary deployments using the provided YAML file.

```bash
kubectl apply -f node-sel.yml
```

### Step 5: Verify Deployments
Check if the pods are correctly scheduled as per the defined labels, taints, and tolerations.

```bash
kubectl get pods -o wide
```

## Additional Notes
- Ensure that the nodes have sufficient resources to schedule the pods.
- Modify the `node-sel.yml` file to define the node affinity, anti-affinity, and tolerations as per the task requirements.

## Resources
- [Kubernetes Node Affinity Documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity)
- [Kubernetes Taints and Tolerations Documentation](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)
- [Kubernetes Labels and Selectors Documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
