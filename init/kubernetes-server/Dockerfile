FROM alpine:3.12
ARG VERSION=v1.19.1
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN apk add --no-cache curl libc6-compat \
  && curl -fL "https://dl.k8s.io/${VERSION}/kubernetes-server-linux-amd64.tar.gz" | tar xfz - -C "/" \
  && mv /kubernetes/server/bin/mounter /usr/bin/ \
  && mv /kubernetes/server/bin/kube-scheduler /usr/bin/ \
  && mv /kubernetes/server/bin/kube-proxy /usr/bin/ \
  && mv /kubernetes/server/bin/kubelet /usr/bin/ \
  && mv /kubernetes/server/bin/kubectl /usr/bin/ \
  && mv /kubernetes/server/bin/kube-controller-manager /usr/bin/ \
  && mv /kubernetes/server/bin/kube-apiserver /usr/bin/ \
  && mv /kubernetes/server/bin/kube-aggregator /usr/bin/ \
  && mv /kubernetes/server/bin/kubeadm /usr/bin/ \
  && mv /kubernetes/server/bin/apiextensions-apiserver /usr/bin/ \
  && rm -rf /kubernetes \
  && apk del --no-cache curl
