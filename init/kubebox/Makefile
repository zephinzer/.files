APP_ID=kubebox
VERSION=v0.8.0
PRIORITY="$$(printf -- "$(VERSION)" | tr -d 'v' | tr -s '.' '\n' | xargs -I@ sh -c 'printf -- "%03d" "@"' | sed 's/^0*//')"
USER=$(shell whoami)

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -Lo /opt/$(APP_ID)/$(VERSION)/$(APP_ID) \
		"https://github.com/astefanutti/kubebox/releases/download/$(VERSION)/kubebox-linux"
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
	
uninstall:
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --remove $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)

purge: uninstall
	rm -rf /opt/$(APP_ID)/$(VERSION)
