FROM ubuntu:22.04

# Install Python dan tools
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    python3.10 \
    python3-pip \
    git \
    wget

# Set Python default
RUN ln -s /usr/bin/python3.10 /usr/bin/python

WORKDIR /workspace

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git

WORKDIR /workspace/kohya_ss

CMD ["/bin/bash", "-c", "echo 'Kohya cloned successfully' && tail -f /dev/null"]
