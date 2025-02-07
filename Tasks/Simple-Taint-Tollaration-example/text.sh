# Explaination :

# Add a taint to a node with env=prod:NoSchedule
# and make sure that the pod can be scheduled on the node with the taint

# add taint to node02 
kubectl taint node node02 env=prod:NoSchedule

# add env=prod label to node02
kubectl label node node02 env=prod

# create deployment 
kubectl create -f taint-tollaration.yml

# check the pod is running on node02
kubectl get pods -o wide






