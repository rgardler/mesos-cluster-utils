# Mesos Cluster Utilities

This project provides the utility "container-service" that provides functions to manage your Azure Mesos cluster created from template https://github.com/Azure/azure-quickstart-templates/tree/master/mesos-swarm-marathon.

To use you must mount an ssh folder that contains the private key of the public key you used to configure the cluster.  Here is a sample command that assumes you are mounting the "ssh" directory under your home directory that contains your private keys:

`docker run -i -t -v ~/ssh:/root/.ssh anhowe/mesos-cluster-utils`

Once in the container type `container-service` to view all the available options.

1. Create SSH key pair.  If you have not already done this, create the pair using instructions from here https://help.ubuntu.com/community/SSH/OpenSSH/Keys.

2. Deploy the Azure Mesos cluster ensuring you specify your public key created in step 1:https://github.com/Azure/azure-quickstart-templates/tree/master/mesos-swarm-marathon

3. On a master node, you need to place your private key in a
 1. login to master
 2. `mkdir ssh`
 3. copy id_rsa to master
    `scp -P 2211 id_rsa azureuser@mesosscalable0923f.westus.cloudapp.azure.com:ssh/.`
 4. `chmod 600 ~/ssh/id_rsa`
 5. `sudo docker run -i -t -v ~/ssh:/root/.ssh anhowe/mesos-cluster-utils`

4. Once in the docker container
 1. `./initialize-cluster.sh`
  - this will warm the thumbprints, analyze the cluster, and pre-pull the images
 2. `./chaos.sh` - this runs a routine where it stops a few nodes, and then sleeps and then scales up
 3. `./submit-demo-app.sh` - this submits a marathon application
