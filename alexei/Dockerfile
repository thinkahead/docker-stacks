# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=default-route-openshift-image-registry.hby-cld-acm-9ca4d14d48413d18ce61b80811ba4308-0000.us-south.containers.appdomain.cloud/default/all-spark-notebook
FROM $BASE_CONTAINER
RUN conda install python-hdfs absl-py
RUN pip3 install tensorflow tensorflow_probability # tensorflow-gpu
#COPY madi2/ /home/jovyan/madi2/
#COPY jupyter-notebook/notebooks/ /home/jovyan/notebooks/
#COPY test-notebooks/ /home/jovyan/
