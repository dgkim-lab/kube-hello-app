#!/usr/bin/env bash

set -euo pipefail

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required but not installed." >&2
  exit 1
fi

if [[ -z "${GITHUB_USERNAME:-}" ]]; then
  echo "Set GITHUB_USERNAME before running this script." >&2
  exit 1
fi

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "Set GITHUB_TOKEN before running this script." >&2
  exit 1
fi

if [[ -z "${IMAGE_OWNER:-}" ]]; then
  echo "Set IMAGE_OWNER to your GitHub organization or user name before running this script." >&2
  exit 1
fi

IMAGE_NAME="${IMAGE_NAME:-kube-hello-app}"
IMAGE_TAG="${IMAGE_TAG:-latest}"
IMAGE_URI="ghcr.io/${IMAGE_OWNER}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "$GITHUB_TOKEN" | docker login ghcr.io -u "$GITHUB_USERNAME" --password-stdin

docker build -t "$IMAGE_URI" .
docker push "$IMAGE_URI"

echo "Pushed ${IMAGE_URI}"
