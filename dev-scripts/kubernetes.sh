# Kube config
kubectl --kubeconfig="/users/z037900/.kube/config_dev" <get pods>

# Kube get pods
kubectl --kubeconfig="/users/z037900/.kube/config_stage" get pods
kubectl --kubeconfig="/users/z037900/.kube/new_config_stage_ttc" get rc
kubectl --kubeconfig="/users/z037900/.kube/config_dev" logs <k8s pod>
kubectl --kubeconfig="/users/z037900/.kube/config_dev" delete rc/<rc name>
kubectl --kubeconfig="/users/z037900/.kube/config_dev" create -f ~/Documents/kafka-router-dev.yaml
kubectl --kubeconfig="/users/z037900/.kube/config_dev" get secrets
kubectl --kubeconfig="/users/z037900/.kube/new_config_stage_ttc" describe rc
kubectl --kubeconfig="/users/z037900/.kube/new_config_stage_ttc" describe pod
kubectl --kubeconfig="/users/z037900/.kube/new_config_stage_ttc" describe namespace farinr-stage

kubectl --kubeconfig="/users/z037900/.kube/new_config_stage_ttc" get pods
# Scale pods
kubectl --kubeconfig="/users/z037900/.kube/config_dev" scale --replicas=0 rc/postgres-sdm-camel-router-prod-5



#Generate secrets
echo -n ftinr02t | base64
echo -n 'Password' | base64
kubectl --kubeconfig="/users/z037900/.kube/new_config_stage_ttc" create -f secret-template.yaml
#Check content
kubectl --kubeconfig="/users/z037900/.kube/new_config_stage_ttc" get secrets -o yaml


Postgresql
Datastage
