APP_ID=kubefedctl
VERSION=0.8.1
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://github.com/kubernetes-sigs/kubefed/releases/download/v$(VERSION)/kubefedctl-$(VERSION)-linux-amd64.tgz" \
		| tar zxf - -C "/opt/$(APP_ID)/$(VERSION)/"
	-mv /opt/$(APP_ID)/$(VERSION)/kubefedctl /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	stat /opt/$(APP_ID)/$(VERSION)/kubefedctl
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
