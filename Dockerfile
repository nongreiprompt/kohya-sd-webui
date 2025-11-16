FROM runpod/stable-diffusion-webui:latest

# Update pip dan instalasi dependencies
RUN pip install --upgrade pip && \
    pip install \
    torch \
    torchvision \
    xformers \
    diffusers \
    transformers

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git /workspace/kohya_ss

# Set working directory
WORKDIR /workspace/kohya_ss

# Install Kohya requirements dengan mode verbose
RUN pip install -v -r requirements.txt

# Optional: Tambahkan command default
CMD ["/bin/bash"]
