APP_ID=gh
VERSION=2.29.0
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	mv /opt/$(APP_ID)/$(VERSION)/gh_${VERSION}_linux_amd64/* /opt/$(APP_ID)/$(VERSION)/
	rm -rf /opt/$(APP_ID)/$(VERSION)/gh_${VERSION}_linux_amd64/
	chmod 750 /opt/$(APP_ID)/$(VERSION)/bin/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/bin/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/bin/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
