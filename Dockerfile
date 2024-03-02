
ARG PYTHON_VERSION=3.10
FROM python:${PYTHON_VERSION}-slim

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
        libgl1 \
        libglib2.0-0 \
        libsm6 libxext6 libxrender-dev \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt
