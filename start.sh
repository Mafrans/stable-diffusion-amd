echo "Outputs will be available in $(pwd)/outputs"

EXISTING_CONTAINER=$(docker container ls --all --filter=ancestor=$1 --format "{{.ID}}")

if [ -n "$EXISTING_CONTAINER" ]; then
    echo "Attaching to $EXISTING_CONTAINER"
    docker start -i $EXISTING_CONTAINER
else
    echo "Creating a new container"
    docker run \
        --network=host \
        --device=/dev/kfd --device=/dev/dri --group-add=video \
        --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
        -p 7860:7860 \
        -v $(pwd)/outputs:/opt/app/outputs \
        -v $(pwd)/models:/opt/app/models \
        -v $(pwd)/embeddings:/opt/app/embeddings \
        -v $(pwd)/scripts:/opt/app/scripts \
        $1
fi
