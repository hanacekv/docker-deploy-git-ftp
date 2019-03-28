FROM hanacekv/php-base:latest

LABEL maintainer="Vojtěch Hanáček <hanacekv@gmail.com>"

ENV CLEAN="$CLEAN:/opt/git-ftp/"

RUN apk add git make --no-cache

RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
    && cd /opt/git-ftp \
    && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
    && git checkout "$tag" \
    && make install \
    && clean