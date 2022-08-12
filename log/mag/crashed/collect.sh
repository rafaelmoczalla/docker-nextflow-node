(docker run --rm --network nextflow_default --volume nextflow_work:/work nextflow-node nextflow run nf-core/mag -profile test,docker -process.executor ignite | tee --append output.log)&
while ps -p $! > /dev/null; do docker stats --no-stream >> out; echo >> out; sleep 0.5; done
