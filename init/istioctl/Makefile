APP_ID=istioctl
VERSION=1.9.0
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://github.com/istio/istio/releases/download/$(VERSION)/istio-$(VERSION)-linux-amd64.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	mv /opt/$(APP_ID)/$(VERSION)/istio-$(VERSION)/bin/istioctl /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	rm -rf /opt/$(APP_ID)/$(VERSION)/istio-$(VERSION)
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
