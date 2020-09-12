APP_ID=kubernetes-node
VERSION=v1.19.1
PRIORITY="$$(printf -- "$(VERSION)" | tr -d 'v' | tr -s '.' '\n' | xargs -I@ sh -c 'printf -- "%03d" "@"' | sed 's/^0*//')"
USER=$(shell whoami)

define COMPONENTS
kube-proxy\n\
kubelet\n\
kubectl\n\
kubeadm\n
endef

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://dl.k8s.io/$(VERSION)/kubernetes-node-linux-amd64.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	echo "$(COMPONENTS)" | xargs -I@ sh -c "mv /opt/$(APP_ID)/$(VERSION)/kubernetes/node/bin/@ /opt/$(APP_ID)/$(VERSION)/@"
	rm -rf /opt/$(APP_ID)/$(VERSION)/kubernetes

image:
	docker build -t zephinzer/k8s-node:latest .

lint:
	hadolint ./Dockerfile \
		--ignore DL3018

test: image
	container-structure-test test --config ./Dockerfile_spec.yaml --image zephinzer/k8s-node:latest
