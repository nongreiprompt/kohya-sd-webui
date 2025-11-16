FROM runpod/stable-diffusion-webui:latest

# Install dependencies
RUN pip install \
    torch==2.4.0+cu121 \
    torchvision==0.19.0+cu121 \
    xformers==0.0.27.post2 \
    diffusers \
    transformers

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git /workspace/kohya_ss

# Set working directory
WORKDIR /workspace/kohya_ss

# Install Kohya requirements
RUN pip install -r requirements.txt
