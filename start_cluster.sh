
# pass cluster name as argument
# if no argument is passed, use default cluster name
CLUSTER_NAME="${1:-kind-cluster}"

# create single node cluster with kind if it is not already created
if ! kind get clusters | grep -q $CLUSTER_NAME
then
  echo "kind cluster not found, creating cluster: $CLUSTER_NAME"

  # create a single node cluster using config file if available
  if [ -f kind-config.yaml ]
  then
    kind create cluster --name $CLUSTER_NAME --config kind-config.yaml
  else
    kind create cluster --name $CLUSTER_NAME
  fi
else
  echo "kind cluster already exists, listing all clusters: $(kind get clusters | paste -sd ', ')"
fi


kubectl cluster-info --context kind-$CLUSTER_NAME
kubectl get nodes