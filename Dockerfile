FROM ubuntu:22.04

# Install Python dan tools
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    python3.10 \
    python3-pip \
    git \
    wget \
    ca-certificates

# Set Python default
RUN ln -s /usr/bin/python3.10 /usr/bin/python

WORKDIR /workspace

# Clone Kohya dengan verbose
RUN git clone --verbose https://github.com/bmaltais/kohya_ss.git

WORKDIR /workspace/kohya_ss

# Install requirements
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port
EXPOSE 3000

# Start Kohya GUI
CMD ["python", "kohya_gui.py", "--listen", "0.0.0.0", "--server_port", "3000"]
