APP_ID=tflint
VERSION=v0.33.0
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -Lo /opt/$(APP_ID)/$(VERSION)/$(APP_ID).zip \
		"https://github.com/terraform-linters/tflint/releases/download/$(VERSION)/tflint_linux_amd64.zip"
	unzip /opt/$(APP_ID)/$(VERSION)/$(APP_ID).zip -d /opt/$(APP_ID)/$(VERSION)
	rm -rf /opt/$(APP_ID)/$(VERSION)/$(APP_ID).zip
	-mv /opt/$(APP_ID)/$(VERSION)/tflint /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) --version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
