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

CMD ["/bin/bash", "-c", "echo 'Container started' && tail -f /dev/null"]
