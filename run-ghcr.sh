#!/usr/bin/env bash

set -euo pipefail

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required but not installed." >&2
  exit 1
fi

if [[ -z "${IMAGE_OWNER:-}" ]]; then
  echo "Set IMAGE_OWNER to your GitHub organization or user name before running this script." >&2
  exit 1
fi

IMAGE_NAME="${IMAGE_NAME:-kube-hello-app}"
IMAGE_TAG="${1:-${IMAGE_TAG:-latest}}"
HOST_PORT="${HOST_PORT:-3000}"
CONTAINER_PORT="${CONTAINER_PORT:-3000}"
IMAGE_URI="ghcr.io/${IMAGE_OWNER}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "Running ${IMAGE_URI} on http://localhost:${HOST_PORT}"

docker run --rm -p "${HOST_PORT}:${CONTAINER_PORT}" "$IMAGE_URI"
