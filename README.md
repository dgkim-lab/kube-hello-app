# kube-hello-app

Simple Node.js hello world app using Express and Docker.

## Run locally

```bash
npm install
npm start
```

Open `http://localhost:3000`.

## Run with Docker

```bash
APP_VERSION=$(git describe --tags --always --dirty) docker compose up --build
```

Open `http://localhost:3000`.

## Push to GitHub Container Registry

```bash
export GITHUB_USERNAME=your-github-user
export GITHUB_TOKEN=your-github-token
export IMAGE_OWNER=your-github-org
./push-ghcr.sh
```

Optional variables:

```bash
export IMAGE_NAME=kube-hello-app
export VERSION=$(git describe --tags --always --dirty)
export IMAGE_TAG=$VERSION
```

By default, `./push-ghcr.sh` uses `git describe --tags --always --dirty` for both the Docker image tag and the app's `APP_VERSION` build argument. Set `VERSION` to override the version string passed into the app, or set `IMAGE_TAG` separately if the registry tag should differ.
If the git-described version contains characters Docker tags do not allow, the default image tag replaces those characters with `-`.

For testing, copy the example env file and fill in your values:

```bash
cp env.example.sh env.sh
source ./env.sh
./push-ghcr.sh
```

## Create a Release Version

See [RELEASE.md](/home/dgkim/git-dgkim-lab/kube-hello-app/RELEASE.md).

## Run from GitHub Container Registry

```bash
export IMAGE_OWNER=your-github-org
./run-ghcr.sh your-tag-name
```

Optional variables:

```bash
export IMAGE_NAME=kube-hello-app
export HOST_PORT=3000
export CONTAINER_PORT=3000
```

## Publish with GitHub Actions

The workflow file is [publish-ghcr.yml](/home/dgkim/git-dgkim-lab/kube-hello-app/.github/workflows/publish-ghcr.yml).

It will build and publish this image to:

```bash
ghcr.io/dgkim-lab/kube-hello-app
```

It runs on pushes to `master` and on manual trigger from the GitHub Actions tab.

## Alternative Docker commands

```bash
VERSION=$(git describe --tags --always --dirty)
IMAGE_TAG=$(printf "%s" "$VERSION" | sed -E "s/[^A-Za-z0-9_.-]+/-/g; s/^[.-]+//; s/^$/dev/")
docker build --build-arg APP_VERSION="$VERSION" -t "kube-hello-app:$IMAGE_TAG" .
docker run -p 3000:3000 "kube-hello-app:$IMAGE_TAG"
```
