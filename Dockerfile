FROM ubuntu:20.04

RUN apt update -y && \
    apt install -y curl xz-utils && \
    rm -fr /var/apt/lists/* && \
    curl https://wasmtime.dev/install.sh -sSf | bash && \
    apt remove --purge

RUN echo "$PROXY_CERT" > /etc/ssl/certs/proxy-cert.crt

CMD ./app
