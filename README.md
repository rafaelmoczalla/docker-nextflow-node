# Nextflow Cluster for Local Use
Author: Rafael Moczalla

Create Date: 5 March 2021

Last Update: 5 March 2021

Tested with Docker in version 20.10.4 and Docker Compose in version 1.28.5 on Ubuntu 18.04.2 LTS.

## Prerequisites
To install Docker run the following commands.

    ```
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
    ```

Test if docker is working with the following command.

    `sudo docker run hello-world`

To install Docker Compose run the following commands.

    ```
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    ```

## Build the Node
Currently to build the cluster you need to build the node images on your own. Run the command
`docker build -t rafaelmoczalla/nextflow-node:1.0 .` to do so.

## Start/Stop the Cluster
To start the cluster just run the following command in the same folder as the docker-compose file.

    `docker-compose up -d --scale node=3`

To change the number of nodes in the cluster replace 3 by the desired number of nodes.

To stop the cluster run the following command in the same folder as the docker-compose file.

    `docker-compose stop`

## Start the Workflow
To start the workflow
1. login into the client node `docker exec -it cluster_client_1 bash` and
2. run the workflow in cluster mode: `nextflow run nf-core/viralrecon test,docker -process.executor ignite`

## Building Custom Image for Cluster Nodes
To build your custom image for the cluster nodes modify the `Dockerfile` and build the new image with the following command.
`docker build -t rafaelmoczalla/docker-nextflow-node:1.0 .`
