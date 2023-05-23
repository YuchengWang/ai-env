FROM registry.cn-hangzhou.aliyuncs.com/modelscope-repo/modelscope:ubuntu20.04-cuda11.3.0-py37-torch1.11.0-tf1.15.5-1.1.0 as base

# Needed for string substitution
SHELL ["/bin/bash", "-c"]
# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        libgdal-dev \
        net-tools \
        numactl \
        pkg-config \
        sudo \
        unzip \
        vim \
        wget \
        zip

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN python3 -m pip --no-cache-dir install --upgrade \
    pip \
    setuptools \
    PySocks

#COPY bashrc /etc/bash.bashrc
#RUN chmod a+rwx /etc/bash.bashrc

# Change USERNAME if needed
ARG USERNAME=ycwang

RUN echo "export PATH=$PATH:/home/${USERNAME}/.local/bin" >> /etc/bash.bashrc

RUN adduser --disabled-password --gecos '' ${USERNAME}
RUN adduser ${USERNAME} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ${USERNAME}

WORKDIR /home/${USERNAME}

# Start a shell in the user's home directory
CMD ["/bin/bash"]
