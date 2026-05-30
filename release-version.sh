#!/usr/bin/env bash

set -euo pipefail

VERSION_BUMP="${1:-patch}"

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required but not installed." >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree must be clean before creating a release version." >&2
  exit 1
fi

npm version "$VERSION_BUMP"

echo "Created release $(git describe --tags --always)"
echo "Push it with: git push origin HEAD --tags"
