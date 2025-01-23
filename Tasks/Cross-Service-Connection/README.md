
# Kubernetes DNS Connection Checking and Troubleshooting Steps

## Connection Checking Steps  

1. **Restart CoreDNS Deployment**  
   To restart CoreDNS and clear any DNS cache issues:
   ```bash
   kubectl -n kube-system rollout restart deployment coredns
   ```

2. **Curl Commands to Verify Connections**  
   Run the following commands to verify the connection between pods across namespaces.

   - **Check connection from `prod-pod` to `stage-service`**:
     ```bash
     kubectl exec -it prod-pod -n prod -- curl -sL http://stage-service.stage.svc.cluster.local
     ```
   
   - **Check connection from `stage-pod` to `prod-service`**:
     ```bash
     kubectl exec -it stage-pod -n stage -- curl -sL http://prod-service.prod.svc.cluster.local
     ```

   - **Check connection from `prod-pod-2` to `stage-service`**:
     ```bash
     kubectl exec -it prod-pod-2 -n prod -- curl -sL http://stage-service.stage.svc.cluster.local
     ```

   - **Check connection from `stage-pod-2` to `prod-service`**:
     ```bash
     kubectl exec -it stage-pod-2 -n stage -- curl -sL http://prod-service.prod.svc.cluster.local
     ```

   - **Check connection from `prod-pod` to `prod-service`**:
     ```bash
     kubectl exec -it prod-pod -n prod -- curl -sL http://prod-service.prod.svc.cluster.local
     ```

   - **Check connection from `stage-pod` to `stage-service`**:
     ```bash
     kubectl exec -it stage-pod -n stage -- curl -sL http://stage-service.stage.svc.cluster.local
     ```

   - **Check connection from `prod-pod-2` to `prod-service`**:
     ```bash
     kubectl exec -it prod-pod-2 -n prod -- curl -sL http://prod-service.prod.svc.cluster.local
     ```

   - **Check connection from `stage-pod-2` to `stage-service`**:
     ```bash
     kubectl exec -it stage-pod-2 -n stage -- curl -sL http://stage-service.stage.svc.cluster.local
     ```

## Troubleshooting Steps

1. **Check CoreDNS Logs**  
   If there are issues with DNS resolution, you can check the logs of the CoreDNS deployment:
   ```bash
   kubectl -n kube-system logs -f deployment/coredns
   ```

2. **Check DNS Resolution Files on Pods**  
   Verify the DNS configuration in the `/etc/resolv.conf` file inside each pod. Replace `pod-name` and `namespace` with actual pod names and namespaces:
   ```bash
   kubectl exec -it pod-name -n namespace -- cat /etc/resolv.conf
   ```

3. **Check for Network Policies**  
   To ensure there are no network policies blocking communication between pods, run the following command to list any network policies across all namespaces:
   ```bash
   kubectl get networkpolicy --all-namespaces
   ```

---

Ensure all steps are executed in sequence and check for any errors or issues that appear. This will help diagnose and fix potential DNS and service connectivity issues in your Kubernetes cluster.
