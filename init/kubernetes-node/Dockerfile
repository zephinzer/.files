FROM alpine:3.12
ARG VERSION=v1.19.1
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN apk add --no-cache curl libc6-compat \
  && curl -fL "https://dl.k8s.io/${VERSION}/kubernetes-node-linux-amd64.tar.gz" | tar xfz - -C "/" \
  && mv /kubernetes/node/bin/kube-proxy /usr/bin/ \
  && mv /kubernetes/node/bin/kubelet /usr/bin/ \
  && mv /kubernetes/node/bin/kubectl /usr/bin/ \
  && mv /kubernetes/node/bin/kubeadm /usr/bin/ \
  && rm -rf /kubernetes \
  && apk del --no-cache curl
