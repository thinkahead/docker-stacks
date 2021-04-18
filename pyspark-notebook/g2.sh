YOUR_NAMESPACE=default
oc project $YOUR_NAMESPACE
docker build -t default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/$YOUR_NAMESPACE/pyspark-notebook:latest .
docker login -u kubeadmin default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud -p `cat oc_token` 2>&1 >/dev/null
if [ $? -ne 0 ]; then
  oc whoami -t > oc_token
  docker login -u kubeadmin default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud -p `cat oc_token`
fi
docker push default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/$YOUR_NAMESPACE/pyspark-notebook:latest
# docker run --publish 8888:8888 default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/pyspark-notebook:latest
