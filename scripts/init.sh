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

if [ -z "$GH_REPO" ]; then
    echo "Please provide your GH_REPO as an env var."
    exit 1
fi

if [ -z "$CLONE_DIR" ]; then
    echo "Please provide your CLONE_DIR as an env var."
    exit 1
fi

apt -y update && apt -y upgrade && apt -y install gh

echo "$GH_TOKEN" | gh auth login --with-token

gh repo clone $GH_REPO $CLONE_DIR