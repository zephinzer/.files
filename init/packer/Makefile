APP_ID=packer
VERSION=1.11.2
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -Lo /opt/$(APP_ID)/$(VERSION)/$(APP_ID).zip \
		"https://releases.hashicorp.com/packer/$(VERSION)/packer_$(VERSION)_linux_amd64.zip"
	unzip /opt/$(APP_ID)/$(VERSION)/$(APP_ID).zip -d /opt/$(APP_ID)/$(VERSION)
	rm -rf /opt/$(APP_ID)/$(VERSION)/$(APP_ID).zip
	-mv /opt/$(APP_ID)/$(VERSION)/packer /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
