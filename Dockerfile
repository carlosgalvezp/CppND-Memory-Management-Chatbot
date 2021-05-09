FROM ubuntu:20.04

ARG USER_NAME
ARG USER_UID
ARG USER_GID

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        build-essential \
        cmake \
        libncurses5-dev \
        libncursesw5-dev \
        libwxgtk3.0-gtk3-0v5 \
        libwxgtk3.0-gtk3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USER_NAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME

USER $USER_NAME
