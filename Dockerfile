FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive"

ARG USER_NAME
ARG USER_UID
ARG USER_GID

RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        build-essential \
        cmake \
        git \
        gdb \
        libncurses5-dev \
        libncursesw5-dev \
        libwxgtk3.0-gtk3-0v5 \
        libwxgtk3.0-gtk3-dev \
        valgrind && \
    rm -rf /var/lib/apt/lists/*

# https://code.visualstudio.com/docs/remote/containers-advanced#_creating-a-nonroot-user
# https://github.com/moby/moby/issues/5419#issuecomment-41478290
RUN groupadd --gid $USER_GID $USER_NAME && \
    useradd --no-log-init --uid $USER_UID --gid $USER_GID --create-home $USER_NAME

USER $USER_NAME
