#
# Build a Docker Image to
# run Jupyter lab remotely.
#

# Use the latest version of Ubuntu.
FROM ubuntu:latest
LABEL maintainer="Josh Mischung josh.mischung@gmail.com"

# Perform updates/upgrades and
# install base utilities.
RUN apt-get autoclean && apt-get update && \
    apt-get upgrade -y && apt-get upgrade -y bash && \
    apt-get install -qq \
    build-essential \
    bzip2 \
    gcc \
    git \
    htop \
    screen \
    vim \
    wget

# Install miniconda, packages,
# and add conda to path.
ENV CONDA_DIR /opt/conda
ADD https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh /tmp/miniconda.sh
RUN bash /tmp/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH
COPY environment_conda.yml /tmp
RUN conda update -y conda && \
    conda env update --file /tmp/environment_conda.yml

# Cleanup files and directories
# from the build.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8888

# Add a new user and change to
# non-root privilage.
RUN useradd -ms /bin/bash --uid 1000 quant
USER quant
RUN conda init && \
    bash -c "source /home/quant/.bashrc" && \
    mkdir /home/quant/notebooks
WORKDIR /home/quant/notebooks

# Configure container startup
CMD ["sh", "-c", "jupyter-lab --ip 0.0.0.0 --port 8888 --no-browser"]
