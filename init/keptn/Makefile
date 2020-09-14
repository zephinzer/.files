APP_ID=keptn
VERSION=0.7.1
PRIORITY="$$(printf -- "$(VERSION)" | tr -d 'v' | tr -s '.' '\n' | xargs -I@ sh -c 'printf -- "%03d" "@"' | sed 's/^0*//')"
USER=$(shell whoami)

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://github.com/keptn/keptn/releases/download/$(VERSION)/$(VERSION)_keptn-linux.tar" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	-mv /opt/$(APP_ID)/$(VERSION)/keptn /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	stat /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
