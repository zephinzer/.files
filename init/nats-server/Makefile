APP_ID=nats-server
VERSION=v2.9.15
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://github.com/nats-io/nats-server/releases/download/${VERSION}/nats-server-${VERSION}-linux-amd64.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	mv /opt/$(APP_ID)/$(VERSION)/nats-server-${VERSION}-linux-amd64/nats-server /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	rm -rf /opt/$(APP_ID)/$(VERSION)/linux-amd64
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
