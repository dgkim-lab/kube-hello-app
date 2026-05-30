#!/usr/bin/env bash

# Copy this file to env.sh, fill in real values, then run:
#   source ./env.sh
#   ./push-ghcr.sh

export GITHUB_USERNAME="your-github-user"
export GITHUB_TOKEN="your-github-token"
export IMAGE_OWNER="your-github-org-or-user"

export IMAGE_NAME="kube-hello-app"
export VERSION="$(git describe --tags --always --dirty)"

# Optional: leave unset to let push-ghcr.sh derive a Docker-safe tag from VERSION.
# export IMAGE_TAG="$VERSION"
