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

## Alternative Docker commands

```bash
docker build -t kube-hello-app .
docker run -p 3000:3000 kube-hello-app
```
