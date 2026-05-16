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
docker compose up --build
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
export IMAGE_TAG=latest
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
docker build -t kube-hello-app .
docker run -p 3000:3000 kube-hello-app
```
