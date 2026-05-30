const express = require("express");

const app = express();
const port = process.env.PORT || 3000;
const version = process.env.APP_VERSION || "dev";

app.get("/", (_req, res) => {
  res.send(`Hello from Express running in Docker! Version: ${version}`);
});

app.listen(port, () => {
  console.log(`Server listening on port ${port} (version: ${version})`);
});
