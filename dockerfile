FROM ubuntu:22.04
MAINTAINER Cyrus Yeung <cyrus0880@outlook.com>

WORKDIR /app

ENV GIT_URL=https://github.com/Titannet-dao/titan-node/releases/download
ENV APPVER=v0.1.14
ARG TARGETPLATFORM


RUN apt update -y && \
    apt install -y curl wget

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        cd /app && \
        wget ${GIT_URL}/${APPVER}/titan_${APPVER}_linux_amd64.tar.gz && \
        tar -zxf titan_${APPVER}_linux_amd64.tar.gz && \
        mv ./titan_${APPVER}_linux_amd64/* ./ && \ 
        rm -fr titan_${APPVER}_linux_amd64 titan_${APPVER}_linux_amd64.tar.gz; \
    else \
        cd /app && \
        wget ${GIT_URL}/${APPVER}/titan_${APPVER}_linux_arm64.tar.gz && \
        tar -zxf titan_${APPVER}_linux_arm64.tar.gz && \
        mv ./titan_${APPVER}_linux_arm64/* ./ && \ 
        rm -fr titan_${APPVER}_linux_arm64 titan_${APPVER}_linux_arm64.tar.gz; \
    fi

RUN chmod +x /app/*
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENV TOKEN=

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]


# docker buildx create --name mybuilder && docker buildx use mybuilder
# docker buildx build --push \
# --platform linux/arm64,linux/arm/v7,linux/arm64/v8,linux/amd64 \ 
# -t cyrus0880/titan-network:0.1.14 -t cyrus0880/titan-network:latest .