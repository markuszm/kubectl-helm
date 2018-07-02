FROM alpine:latest

ENV HELM_VERSION 2.9.1
ENV KUBERNETES_VERSION 1.9.9

RUN apk add -U openssl curl tar gzip bash ca-certificates git && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk && \
    apk add glibc-2.23-r3.apk && \
    rm glibc-2.23-r3.apk && \
    curl "https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar zx && \
    mv linux-amd64/helm /usr/bin/ && \
    curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" && \
    chmod +x /usr/bin/kubectl \