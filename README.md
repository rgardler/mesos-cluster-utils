# Mesos Cluster Utilities

This project provides the utility "container-service" that provides functions to manage your Azure Mesos cluster created from template https://github.com/Azure/azure-quickstart-templates/tree/master/mesos-swarm-marathon.

To use you must mount an ssh folder that contains the private key of the public key you used to configure the cluster.  Here is a sample command that assumes you are mounting the "ssh" directory under your home directory:

`docker run -i -t -v ~/ssh:/root/.ssh anhowe/mesos-cluster-utils`

Once in the container type `container-service` to view all the available options.
