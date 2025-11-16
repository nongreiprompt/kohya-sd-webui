FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Update sistem
RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    wget

# Install dependencies
RUN pip install --upgrade pip && \
    pip install \
    torch \
    torchvision \
    xformers \
    diffusers \
    transformers \
    accelerate

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git /workspace/kohya_ss

# Set working directory
WORKDIR /workspace/kohya_ss

# Install Kohya requirements dengan mode verbose
RUN pip install -v -r requirements.txt

# Optional: Tambahkan command default
CMD ["/bin/bash"]
