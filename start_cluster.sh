
# pass cluster name as argument
# if no argument is passed, use default cluster name
CLUSTER_NAME="${1:-kind-cluster}"

# create single node cluster with kind if it is not already created
if ! kind get clusters | grep -q $CLUSTER_NAME
then
    kind create cluster --name $CLUSTER_NAME
else
  echo "kind cluster already exists, listing all clusters: $(kind get clusters | paste -sd ', ')"
fi


kubectl cluster-info --context kind-$CLUSTER_NAME
kubectl get nodes