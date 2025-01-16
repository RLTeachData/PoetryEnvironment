# Introduction
使用 Dockerfile 製作 Poetry 開發環境
# Build step by step
- Build image with the dockerfile.
```bash
cd PoetryEnvironment
podman build -t poetry .
```
- Run container with image.
```bash
podman run --name PoetryENV -v .:/mywork -it poetry sh
```
