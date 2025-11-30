# Use Ubuntu as base image
FROM ubuntu:22.04

# Update packages and install CMUS
RUN apt-get update && \
    apt-get install -y \
		cmus \
    alsa-utils \
    pulseaudio-utils \
    tmux \
    triggerhappy \
    evtest \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for music files (optional)
RUN mkdir -p /music

# Set working directory
WORKDIR /music

# Just keep container running - NO auto-start of CMUS
CMD ["tail", "-f", "/dev/null"]
