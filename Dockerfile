FROM python:3.10-slim

# Install dependencies sistem
RUN apt-get update && apt-get install -y \
    git \
    wget \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git /workspace/kohya_ss

WORKDIR /workspace/kohya_ss

# Install Python packages
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port untuk GUI
EXPOSE 3000

# Keep container alive
CMD ["tail", "-f", "/dev/null"]
