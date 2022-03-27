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
    apt-utils \
    build-essential \
    bzip2 \
    gcc \
    git \
    jq \
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
    conda env update --file /tmp/environment_conda.yml && \
    jupyter labextension update --all && \
    jupyter labextension install jupyterlab-theme-solarized-dark && \
    jupyter lab build -y && \
    jupyter lab clean -y

# Install the `expect` package and cleanup
# files and directories from the build.
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -yq install expect graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add a new user and change to
# non-root privilage.
RUN useradd -ms /bin/bash --uid 1000 ds
USER ds
COPY jup_lab_settings /home/ds/.jupyter

# Set non-root user as the owner of their .jupyter directory
# and the jupyter config scripts.
USER root
COPY config_files /home/ds/config_files
RUN chown -R ds /home/ds/.jupyter && \
    chown -R ds /home/ds/config_files
USER ds
WORKDIR /home/ds/config_files

# Create jupyter password and set it
# in the jupyter config file.
ARG JUP_PASSWD
RUN expect set_jup_passwd.sh && \
    JUP_HASHED_PASSWD=$(jq -r '.ServerApp.password' < ../.jupyter/jupyter_server_config.json) && \
    sed -i "377s~.*~c.ServerApp.password = '$JUP_HASHED_PASSWD'~" ../.jupyter/jupyter_server_config.py && \
    unset JUP_PASSWD JUP_HASHED_PASSWD && \
    mkdir /home/ds/notebooks && \
    conda init && \
    bash -c "source /home/ds/.bashrc"
WORKDIR /home/ds/notebooks
RUN rm -rf /home/ds/config_files

# Configure container startup.
EXPOSE 8888
CMD ["sh", "-c", "jupyter lab --ip 0.0.0.0 --port 8888"]
