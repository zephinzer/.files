APP_ID=kubernetes-server
VERSION=v1.19.1
PRIORITY="$$(printf -- "$(VERSION)" | tr -d 'v' | tr -s '.' '\n' | xargs -I@ sh -c 'printf -- "%03d" "@"' | sed 's/^0*//')"
USER=$(shell whoami)

define COMPONENTS
mounter\n\
kube-scheduler\n\
kube-proxy\n\
kubelet\n\
kubectl\n\
kube-controller-manager\n\
kube-apiserver\n\
kube-aggregator\n\
kubeadm\n\
apiextensions-apiserver\n
endef

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://dl.k8s.io/$(VERSION)/kubernetes-server-linux-amd64.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	echo "$(COMPONENTS)" | xargs -I@ mv /opt/$(APP_ID)/$(VERSION)/kubernetes/server/bin/@ /opt/$(APP_ID)/$(VERSION)/@
	rm -rf /opt/$(APP_ID)/$(VERSION)/kubernetes

image:
	docker build -t zephinzer/k8s-server:latest .

lint:
	hadolint ./Dockerfile \
		--ignore DL3018

test: image
	container-structure-test test --config ./Dockerfile_spec.yaml --image zephinzer/k8s-server:latest

