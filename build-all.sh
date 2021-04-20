echo Building base-notebook
cd /Users/karve/Downloads/6x6orchestration/docker-stacks/base-notebook
docker build -t default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/base-notebook .
echo Building minimal-notebook
cd /Users/karve/Downloads/6x6orchestration/docker-stacks/minimal-notebook
docker build -t default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/minimal-notebook .
echo Building scipy-notebook
cd /Users/karve/Downloads/6x6orchestration/docker-stacks/scipy-notebook
docker build -t default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/scipy-notebook .
echo Building pyspark-notebook
cd /Users/karve/Downloads/6x6orchestration/docker-stacks/pyspark-notebook
docker build -t default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/pyspark-notebook .
echo Building all-spark-notebook
cd /Users/karve/Downloads/6x6orchestration/docker-stacks/all-spark-notebook
docker build -t default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/all-spark-notebook .
echo Building madi-notebook:noGPU
cd /Users/karve/Downloads/6x6orchestration/docker-stacks/alexei
./g2.sh # Does the build and push shown in steps below for madi-notebook:noGPU image
