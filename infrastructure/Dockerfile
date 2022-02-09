#
# Build a Docker Image to
# run Jupyter lab remotely.
#

# latest Ubuntu version
FROM ubuntu:latest
LABEL maintainer="Josh Mischung josh.mischung@gmail.com"

# update apt-get and install the necessary dependencies
RUN apt-get autoclean && apt-get update && \
apt-get upgrade -y && apt-get upgrade -y bash && \
apt-get install -qq \
    bzip2 \
    gcc \
    git \
    htop \
    screen \
    vim \
    wget
