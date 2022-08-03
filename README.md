# Nextflow Echo Workflow with Local Apache Ignite Cluster
Author: Rafael Moczalla

Create Date: 5 March 2021

Last Update: 3 August 2022

Tested with Docker in version 20.10.4 and Docker Compose in version 1.28.5 on Ubuntu 18.04.2 LTS.

## Prerequisites
To install Docker run the following commands.

    ```bash
    sudo apt install default-jdk-headless docker-ce
    ```

To install Docker Compose run the following commands.

    ```bash
    sudo curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
    ```

## Building Custom Image for Cluster Nodes
To build your custom image for the cluster nodes modify the `Dockerfile` and build the new image with the following command.

    `docker build -t rafaelmoczalla/docker-nextflow-node:latest .`

## Start the Cluster
To start the cluster just run the following command in the same folder as the docker-compose file.

    `docker-compose --project-name nextflow up --scale node=3`

To change the number of nodes in the cluster replace 3 by the desired number of nodes.

To stop the cluster just press `ctrl+c`.

## Start the Scientific Workflow
To start the scientific workflow create a new client node run the workflow in cluster mode

    `docker run --interactive --tty --rm --network nextflow_default --volume nextflow_work:/work rafaelmoczalla/docker-nextflow-node nextflow run test.nf -process.executor ignite`

## After a Scientific Workflow Run

After a run of the workflow the volume needs to be cleaned as nextflow is not cleaning temporal data. We are doing it by deleting the volume with docker.

    `docker volumes rm nextflow_work`

To have a look on the temporal data & logs we can login to one of the nodes & inspect the `/work` folder.

    `docker exec --interactive --tty nextflow-node-1 /bin/bash`
    `cd work && ls`


