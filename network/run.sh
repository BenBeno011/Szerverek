#!/usr/bin/env bash

set -e

IMAGE_NAME="mypython-network"
IMAGE_TAG="v1"
FULL_IMAGE="${IMAGE_NAME}:${IMAGE_TAG}"
CONTAINER_NAME="python-network1"
HOSTNAME_NAME="python-network1"

VOLUME_MAPPING="/home/admin/docker/network:/shared"
PORT_MAPPING="5005:5005"
NETWORK="mynet"

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
	docker build -t "$FULL_IMAGE" -f ./Dockerfile .
        echo "[INFO] Container létrehozása..."
        docker create -it \
            -v "$VOLUME_MAPPING" \
            -p "$PORT_MAPPING" \
            --name "$CONTAINER_NAME" \
            --hostname "$HOSTNAME_NAME" \
            --network "$NETWORK" \
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
