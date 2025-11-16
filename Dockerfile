FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel-ubuntu22.04

WORKDIR /workspace

# Install git
RUN apt-get update && apt-get install -y git

# Clone Kohya
RUN git clone https://github.com/bmaltais/kohya_ss.git

WORKDIR /workspace/kohya_ss

# Install requirements
RUN pip install -r requirements.txt

# Keep alive
CMD ["sleep", "infinity"]
