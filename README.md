## CFML Dev Container

An experiment in using the VS Code Remote Containers extension for a containerized CFML development environment.

### Usage

1. Copy the configuration files into your project and customize

2. Clone the project and customize then build your own image to reuse.

i.e.

```
docker build -t <yourdockerhubuserid>/cfml-devcontainer:latest --target cfml-devcontainer .
docker build -t <yourdockerhubuserid>/cfml-devcontainer:with-node --target with-node .
```
