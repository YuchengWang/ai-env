# Copyright 2019 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================
#
# THIS IS A GENERATED DOCKERFILE.
#
# This file was assembled from multiple pieces, whose use is documented
# throughout. Please refer to the TensorFlow dockerfiles documentation
# for more information.

FROM tensorflow/tensorflow:latest-gpu as base

# Let us install tzdata painlessly
ENV DEBIAN_FRONTEND=noninteractive

# Needed for string substitution
SHELL ["/bin/bash", "-c"]
# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        libgdal-dev \
        net-tools \
        pkg-config \
        sudo \
        unzip \
        vim \
        wget \
        zip

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y

RUN python3 -m pip --no-cache-dir install --upgrade \
    pip \
    setuptools \
    PySocks

COPY bashrc /etc/bash.bashrc
RUN chmod a+rwx /etc/bash.bashrc

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