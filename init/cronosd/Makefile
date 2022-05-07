APP_ID=cronosd
# ref https://github.com/crypto-org-chain/cronos/releases
VERSION=0.7.0
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://github.com/crypto-org-chain/cronos/releases/download/v$(VERSION)/cronos_$(VERSION)_Linux_x86_64.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	chmod 750 /opt/$(APP_ID)/$(VERSION)/bin/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/bin/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/bin/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
