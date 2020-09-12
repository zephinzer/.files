APP_ID=etcd
VERSION=v3.3.25
PRIORITY="$$(printf -- "$(VERSION)" | tr -d 'v' | tr -s '.' '\n' | xargs -I@ sh -c 'printf -- "%03d" "@"' | sed 's/^0*//')"
USER=$(shell whoami)

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fsL "https://github.com/etcd-io/etcd/releases/download/$(VERSION)/etcd-$(VERSION)-linux-amd64.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	mv /opt/$(APP_ID)/$(VERSION)/etcd-$(VERSION)-linux-amd64/* /opt/$(APP_ID)/$(VERSION)/
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)ctl
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) --version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID)ctl --version
	-update-alternatives --list $(APP_ID)ctl
	sudo update-alternatives --install /usr/bin/$(APP_ID)ctl $(APP_ID)ctl /opt/$(APP_ID)/$(VERSION)/$(APP_ID)ctl $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)ctl
