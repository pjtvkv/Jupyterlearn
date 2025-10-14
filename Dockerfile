FROM python:3.11-slim

# Install system dependencies and cleanup layer
RUN apt-get update \
    && apt-get install --yes --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for running Jupyter
RUN useradd --create-home --shell /bin/bash jovyan \
    && mkdir -p /workspace \
    && chown jovyan:jovyan /workspace

# Install Python dependencies; extend requirements.txt as needed
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# All project files will live here and be mounted in via docker-compose
WORKDIR /workspace

# Default to the jovyan user for runtime
USER jovyan

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--ServerApp.token=", "--ServerApp.password="]
