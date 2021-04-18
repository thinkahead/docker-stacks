YOUR_NAMESPACE=default
oc project $YOUR_NAMESPACE
docker build -t default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/$YOUR_NAMESPACE/madi-notebook:noGPU .
docker login -u kubeadmin default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud -p `cat oc_token` 2>&1 >/dev/null
if [ $? -ne 0 ]; then
  oc whoami -t > oc_token
  docker login -u kubeadmin default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud -p `cat oc_token`
fi
docker push default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/$YOUR_NAMESPACE/madi-notebook:noGPU
# docker run --publish 8888:8888 default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/madi-notebook:noGPU
#oc new-app --template jupyter-notebook-quickstart --param APPLICATION_NAME=mynotebook --param GIT_REPOSITORY_URL=https://github.com/jakevdp/sklearn_pycon2015 --param CONTEXT_DIR=notebooks --param BUILDER_IMAGE=image-registry.openshift-image-registry.svc:5000/default/madi-notebook:noGPU --param NOTEBOOK_PASSWORD=watson914
#oc logs -f buildconfig/mynotebook
# oc delete all,configmap,pvc,serviceaccount,rolebinding,buildconfig --selector app=mynotebook
