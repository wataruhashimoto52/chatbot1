FROM continuumio/miniconda3

MAINTAINER Tomofumi Inoue <funaox@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

# Install TensorFlow, Jupyter, Flask, MeCab, Tweepy
RUN set -xe \
    && apt-get update --fix-missing \
    && apt-get install --no-install-recommends --no-install-suggests -y gcc g++ mecab libmecab-dev mecab-ipadic-utf8 \
    && pip install mecab-python3 tweepy \
    && conda install -y tensorflow jupyter flask \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install forego
RUN wget 'https://bin.equinox.io/c/ekMN3bCZFUn/forego-stable-linux-amd64.deb' \
    && dpkg --install forego-stable-linux-amd64.deb \
    && rm forego-stable-linux-amd64.deb

# Flask default port
EXPOSE 5000
