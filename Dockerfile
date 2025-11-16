FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Install Python dan dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set Python3.10 sebagai default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

WORKDIR /workspace

# Keep alive dengan bash
CMD ["/bin/bash", "-c", "while true; do sleep 3600; done"]
