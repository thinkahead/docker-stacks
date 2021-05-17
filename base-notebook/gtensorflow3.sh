YOUR_NAMESPACE=default
oc project $YOUR_NAMESPACE
echo Building
PROXY_URL="//10.3.0.3:3128"
export http_proxy="http:$PROXY_URL"
export https_proxy="http:$PROXY_URL"
export ftp_proxy="ftp:$PROXY_URL"
export no_proxy="10.3.158.0/24,127.0.0.1,localhost"
podman build --tls-verify=false -t default-route-openshift-image-registry.apps.ibm-hcs.priv/$YOUR_NAMESPACE/base-notebook-tensorflow3 -f Dockerfile.ppc64le.tensorflow3 .
#podman build --squash-all --tls-verify=false -t default-route-openshift-image-registry.apps.ibm-hcs.priv/$YOUR_NAMESPACE/base-notebook-tensorflow3 -f Dockerfile.ppc64le.tensorflow3 .
echo Result=$?
echo Logging in to registry
unset http_proxy
unset https_proxy
podman login --tls-verify=false -u kubeadmin default-route-openshift-image-registry.apps.ibm-hcs.priv -p `cat oc_token` 2>&1 >/dev/null
if [ $? -ne 0 ]; then
  oc whoami -t > oc_token
  podman login --tls-verify=false -u kubeadmin default-route-openshift-image-registry.apps.ibm-hcs.priv -p `cat oc_token`
fi
echo Pushing
podman push --tls-verify=false default-route-openshift-image-registry.apps.ibm-hcs.priv/$YOUR_NAMESPACE/base-notebook-tensorflow3
