APP_ID := temporal
VERSION := 0.7.0
-include ../Makefile

DOWNLOAD_URL := https://github.com/temporalio/cli/releases/download/v$(VERSION)/temporal_cli_$(VERSION)_linux_amd64.tar.gz

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "/opt/$(APP_ID)/${VERSION}/$(APP_ID).tar.gz" "$(DOWNLOAD_URL)" | tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	if ! [ -e /opt/$(APP_ID)/$(VERSION)/$(APP_ID) ]; then \
		mv "/opt/$(APP_ID)/${VERSION}/temporal" /opt/$(APP_ID)/$(VERSION)/$(APP_ID); \
	fi
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) --version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
