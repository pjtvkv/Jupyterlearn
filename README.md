# Jupyterlearn

This repository ships a Dockerized Jupyter setup so you can run Python notebooks without installing Python locally.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- (Optional) [Docker Compose CLI plugin](https://docs.docker.com/compose/)

## Usage
1. Build the image (only needed the first time or after Dockerfile changes):
   ```bash
   docker compose build
   ```
2. Start Jupyter Lab:
   ```bash
   docker compose up
   ```
3. Open your browser to [http://localhost:8888](http://localhost:8888). The notebook server runs without an auth token inside the local network.

### Adding Dependencies
To add Python packages, either:
- edit the `pip install` line in the `Dockerfile` and rebuild, or
- create a `requirements.txt`, copy it in the Dockerfile, and install with `pip install -r requirements.txt`.

### Notebook Storage
Your repository directory is mounted into the container at `/workspace`. Any notebooks you create or edit are saved to the host filesystem automatically.

### Environment Variables
To configure secrets such as the OpenAI API key:
1. Copy `.env.example` to `.env`.
2. Replace `sk-...` with your actual OpenAI API key.
3. Restart the Compose stack so the container picks up the new environment variables.
