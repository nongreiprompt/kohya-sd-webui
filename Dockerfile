FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git /workspace/kohya_ss

WORKDIR /workspace/kohya_ss

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt \
    torch \
    torchvision \
    gradio \
    accelerate

# Tambah debug command
CMD ["/bin/bash", "-c", "pip list && python --version && ls"]
