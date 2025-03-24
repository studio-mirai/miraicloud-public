#!/bin/bash

DEBIAN_FRONTEND=noninteractive

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

if [ -z "$GH_TOKEN" ]; then
    echo "Please provide your GH_TOKEN as an env var."
    exit 1
fi

if [ -z "$REPO_NAME" ]; then
    echo "Please provide your REPO_NAME as an env var."
    exit 1
fi

if [ -z "$REPO_OWNER" ]; then
    echo "Please provide your REPO_OWNER as an env var."
    exit 1
fi

if [ -z "$CLONE_DIR" ]; then
    echo "Please provide your CLONE_DIR as an env var."
    exit 1
fi

apt -y update && apt -y upgrade && apt -y install git

git clone https://${GH_TOKEN}@github.com/${REPO_OWNER}/${REPO_NAME} $CLONE_DIR