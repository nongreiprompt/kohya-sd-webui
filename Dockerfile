FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    bash \
    curl

WORKDIR /workspace

CMD ["/bin/bash", "-c", "echo 'Container started' && tail -f /dev/null"]
