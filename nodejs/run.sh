#!/usr/bin/env bash

set -e

IMAGE_NAME="mynode"
IMAGE_TAG="v1"
FULL_IMAGE="${IMAGE_NAME}:${IMAGE_TAG}"
CONTAINER_NAME="node1"
HOSTNAME_NAME="node1"

VOLUME_MAPPING="/home/admin/docker/node:/shared"
PORT_MAPPING="3000:3000"

#Usage
usage() {
    echo "Használat: $0 {install|remove}"
    exit 1
}

#Check params
if [ $# -ne 1 ]; then
    usage
fi

case "$1" in
    install)
        echo "[INFO] Docker image build..."
        # docker build -t mytag .
	docker build -t "$FULL_IMAGE" .
        echo "[INFO] Container létrehozása..."
        docker create -it \
            -v "$VOLUME_MAPPING" \
            -p "$PORT_MAPPING" \
            --name "$CONTAINER_NAME" \
            --hostname "$HOSTNAME_NAME" \
            "$FULL_IMAGE"

        echo "[INFO] Container indítása..."
        docker start "$CONTAINER_NAME"
        ;;
    
    remove)
        echo "[INFO] Container leállítása és törlése..."
        docker stop "$CONTAINER_NAME" || true
        docker rm "$CONTAINER_NAME" || true

        echo "[INFO] Image törlése..."
        docker rmi "$FULL_IMAGE" || true
        ;;
    
    *)
        usage
        ;;
esac
