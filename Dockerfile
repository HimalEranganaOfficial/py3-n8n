FROM n8nio/n8n:latest

LABEL maintainer="Himal Erangana <https://github.com/HimalEranganaOfficial>"
LABEL description="A custom Docker image that extends the official n8n image with Python3, pip, and pipx pre-installed. Perfect for running Python scripts within your n8n workflows!"
LABEL version="1.0.0"

USER root

# Work in a temporary directory
WORKDIR /tmp

# Download apk-tools-static and extract apk.static
RUN wget https://dl-cdn.alpinelinux.org/latest-stable/main/x86_64/apk-tools-static-3.0.4-r0.apk && \
    tar -zxvf apk-tools-static-3.0.4-r0.apk && \
    ./sbin/apk.static --no-cache add apk-tools && \
    rm -rf /tmp/*

# Go back to home directory
WORKDIR /home/node

# Now apk is restored at /sbin/apk! Install Python
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache python3 py3-pip py3-setuptools pipx && \
    ln -sf python3 /usr/bin/python && \
    ln -sf pip3 /usr/bin/pip && \
    rm -f /usr/lib/python3.12/EXTERNALLY-MANAGED && \
    apk add --no-cache sudo && \
    echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER node

# Setup pipx for node user
ENV PATH="/home/node/.local/bin:$PATH"
RUN pipx ensurepath
