#!/bin/bash

REGISTRY="registry.cn-chengdu.aliyuncs.com"
GROUP="hpmr"
APP="mcp-sse"
TAG=$1

if [ -z "$TAG" ] ; then
  TAG="latest"
fi

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH && cd .. || exit

IMG="${REGISTRY}/${GROUP}/${APP}:$TAG"

MACHINE_ARCH=$(uname -m)
OS_NAME=$(uname -s)

# Check if it's macOS arm64
if [ "$MACHINE_ARCH" == "arm64" ] && [ "$OS_NAME" == "Darwin" ] ; then
  echo "Running on macOS arm64, using docker buildx"
  docker buildx build --platform=linux/amd64 -t $IMG . --push
else
  echo "Running on $OS_NAME $MACHINE_ARCH, using docker build"
  docker build --platform=linux/amd64 -t $IMG . --push
fi
