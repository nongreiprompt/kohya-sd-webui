FROM ubuntu:22.04

# Install Python dan tools
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    python3.10 \
    python3-pip \
    git \
    wget \
    ca-certificates \
    build-essential

# Set Python default
RUN ln -s /usr/bin/python3.10 /usr/bin/python

WORKDIR /workspace

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git

WORKDIR /workspace/kohya_ss

# Install dependencies manual (skip requirements.txt)
RUN pip install --upgrade pip && \
    pip install torch torchvision gradio accelerate transformers

# Expose port
EXPOSE 3000

CMD ["/bin/bash", "-c", "echo 'Ready' && tail -f /dev/null"]
