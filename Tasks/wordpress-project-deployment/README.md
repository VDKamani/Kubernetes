# WordPress Deployment on Kubernetes

This project provides the resources and steps required to deploy a WordPress application along with a MySQL database on a Kubernetes cluster. It uses Kubernetes `Deployments`, `StatefulSets`, `Persistent Volumes (PV)`, `Persistent Volume Claims (PVC)`, and `Services` to ensure the WordPress and MySQL components are deployed and configured properly.

## Files Included

1. **kustomization.yaml**:  
   Defines the resources to be deployed on the Kubernetes cluster. It combines multiple resources for deployment.

2. **wordpress-deployment.yaml**:  
   Used to deploy the WordPress application as a `Deployment` on the cluster.  
   - Contains definitions for:
     - Deployment
     - PVC for WordPress data
     - Service to expose WordPress

3. **mysql-deployment.yaml**:  
   Used to deploy the MySQL database as a `StatefulSet`.  
   - Contains definitions for:
     - StatefulSet
     - PVC for MySQL data
     - Service to expose MySQL

4. **pv.yaml**:  
   Defines the Persistent Volumes (PV) used for:
   - MySQL database storage
   - WordPress data storage
   - SQL dump storage

## Prerequisites

### Hardware Requirements
- **1 Control Node**
- **1 Worker Node** (to deploy the pods)
- **20GB of storage** 
- **2 vCPU and 4 GB RAM** (Minimum)

### Software Requirements
- **AWS CLI** installed on both the control and worker nodes.
- **kubectl** installed and configured to manage the cluster.
- Appropriate IAM roles attached to the nodes to allow required permissions for AWS services.

### Project Requirements
- **Data Add** make sure that you need to add the data to respective mounted directories, Like project data to `/mnt/data/wordpress`,mysql dump to `Wordpress-sql-dump`.

## Deployment Steps

1. Clone the repository containing the deployment files to the control node:
   ```bash
   git clone https://github.com/VDKamani/Kubernetes.git
   cd Kubernetes
   cd Tasks/wordpress-project-deployment
   ```

2. Make the deployment script executable:
   ```bash
   chmod +x Deploy.sh
   ```

3. Run the deployment script:
   ```bash
   ./Deploy.sh
   ```

4. Verify the deployment using:
   ```bash
   kubectl get all
   ```

## Manual Verification Commands

To manually verify the deployment, you can use the following commands:

- **Check pods and their status:**
  ```bash
  kubectl get pods -o wide
  ```

- **Check services and their endpoints:**
  ```bash
  kubectl get svc
  ```

- **Check persistent volume claims:**
  ```bash
  kubectl get pvc
  ```

- **Check persistent volumes:**
  ```bash
  kubectl get pv
  ```

## Notes

- The WordPress deployment uses a Kubernetes `Deployment` to manage its pods.
- The MySQL deployment uses a Kubernetes `StatefulSet` to ensure stateful behavior.
- The Persistent Volumes (PV) and Persistent Volume Claims (PVC) ensure data persistence for WordPress and MySQL.

## Additional Information

- Ensure that your Kubernetes cluster has sufficient resources to deploy the pods.
- If you encounter any issues with IAM permissions, verify the roles attached to the nodes.
- Update the `Deploy.sh` script or YAML files if required to match your specific environment.
- Also make sure to add anything else in `kustomization.yml` if you add extra files that need to run along with full deployment.

By following the steps above, you can successfully deploy a WordPress application backed by a MySQL database on a Kubernetes cluster.

