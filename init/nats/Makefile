APP_ID=nats
VERSION=0.0.35
-include ../Makefile

install_linux:
	# sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	# sudo chown $(USER):root -R /opt/$(APP_ID)
	# curl -fsSLo "/opt/$(APP_ID)/${VERSION}/$(APP_ID).zip" "https://github.com/nats-io/natscli/releases/download/v${VERSION}/nats-${VERSION}-linux-amd64.zip"
	# unzip "/opt/$(APP_ID)/${VERSION}/$(APP_ID).zip" -d "/opt/$(APP_ID)/${VERSION}"
	mv "/opt/nats/${VERSION}/nats-${VERSION}-linux-amd64/nats" /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) --version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
