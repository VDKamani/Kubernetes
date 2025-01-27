
# README

## Task 1 : custome-scheduling-80-20.yml

### Explanation:
In this task, there are 4 deployments, each having 4 nodes:

1. **Deployment 1**: All pods will be deployed on the worker node.
2. **Deployment 2**: 50% of the pods will be deployed on `worker02` and 50% on `worker03`.
3. **Deployment 3**: Similar to Deployment 2, 50% of the pods will be deployed on `worker02` and 50% on `worker03`.
4. **Deployment 4**: 80% of the pods will be deployed where Deployment 3 has more pods, and 20% of the pods where Deployment 3 has fewer pods.

### YAML Configuration:
- `deployment1`: Uses `nodeSelector` to ensure all pods are deployed on the worker node.
- `deployment2` and `deployment3`: Use `nodeAffinity` to split pods evenly between `worker02` and `worker03`.
- `deployment4`: Uses `podAffinity` with weights to allocate pods based on the distribution of Deployment 3.

## Task 2 : custome-scheduling.yml

### Explanation:
In this task, there are also 4 deployments, each having 4 nodes:

1. **Deployment 1**: All pods will be deployed on the worker node.
2. **Deployment 2**: 50% of the pods will be deployed on `worker02` and 50% on `worker03`.
3. **Deployment 3**: Similar to Deployment 2, 50% of the pods will be deployed on `worker02` and 50% on `worker03`.
4. **Deployment 4**: All pods will be deployed where Deployment 3 has more pods.

### YAML Configuration:
- `deployment1`: Uses `nodeSelector` for pod placement on the worker node.
- `deployment2` and `deployment3`: Use `nodeAffinity` to ensure an even distribution between `worker02` and `worker03`.
- `deployment4`: Uses `podAffinity` with a 100% weight to allocate all pods to the node where Deployment 3 has the most pods.

---
### Notes:
- Each deployment uses the Nginx container image for demonstration purposes.
- Pod distribution is controlled using Kubernetes `nodeAffinity` and `podAffinity` configurations.

---
