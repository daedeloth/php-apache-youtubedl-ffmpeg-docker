FROM php:8.0-apache
MAINTAINER daedelson@gmail.com

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=en_US:en

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update
RUN apt-get install ffmpeg zip git -y

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install youtube-dl
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

EXPOSE 80
