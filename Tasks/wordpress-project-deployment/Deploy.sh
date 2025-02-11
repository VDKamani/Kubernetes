#!/bin/bash

# Variables
REGION="your-region"
ECR_URL="your-url"
NAMESPACE="default"

# Validate AWS CLI availability
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it before proceeding."
    exit 1
fi

# Validate kubectl availability
if ! command -v kubectl &> /dev/null; then
    echo "kubectl is not installed. Please install it before proceeding."
    exit 1
fi

# Create a Kubernetes secret for ECR registry credentials
echo "Creating Kubernetes secret for ECR registry..."
aws ecr get-login-password --region "$REGION" | kubectl create secret docker-registry ecr-registry \
    --docker-server="$ECR_URL" \
    --docker-username=AWS \
    --docker-password=$(aws ecr get-login-password --region "$REGION") \
    --namespace="$NAMESPACE"

if [ $? -ne 0 ]; then
    echo "Failed to create Kubernetes secret for ECR registry. Please check the credentials and try again."
    exit 1
fi

# Apply Kubernetes manifests
echo "Applying Kubernetes manifests..."
kubectl apply -k ./

if [ $? -eq 0 ]; then
    echo "Deployment initiated successfully."
else
    echo "Failed to apply Kubernetes manifests. Please check the manifests and try again."
    exit 1
fi

# Verification step (optional)
echo "Verifying deployment status..."
kubectl get all -n "$NAMESPACE"

echo "Deployment complete. Please verify using kubectl commands as needed."
