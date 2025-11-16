FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Update sistem dan install dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip dan install dependencies
RUN pip install --upgrade pip && \
    pip install \
    torch==2.0.1 \
    torchvision==0.15.2 \
    xformers \
    diffusers \
    transformers \
    accelerate \
    && pip cache purge

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git /workspace/kohya_ss

# Set working directory
WORKDIR /workspace/kohya_ss

# Install Kohya requirements dengan mode verbose
RUN pip install -v -r requirements.txt

# Optional: Tambahkan command default
CMD ["/bin/bash"]
