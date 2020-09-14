APP_ID=node
VERSION=v12.18.3
PRIORITY="$$(printf -- "$(VERSION)" | tr -d 'v' | tr -s '.' '\n' | xargs -I@ sh -c 'printf -- "%03d" "@"' | sed 's/^0*//')"
USER=$(shell whoami)

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://nodejs.org/dist/${VERSION}/node-${VERSION}-linux-x64.tar.xz" \
		| tar xvfJ - -C /opt/$(APP_ID)/$(VERSION)/
	mv /opt/$(APP_ID)/$(VERSION)/node-$(VERSION)-linux-x64/bin/node \
		/opt/$(APP_ID)/$(VERSION)/node
	rm -rf /opt/$(APP_ID)/$(VERSION)/node-$(VERSION)-linux-x64
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) --version
	@printf -- 'displaying alternatives...\n'
	- update-alternatives --list $(APP_ID)
	@printf -- 'to add an alternative, use:\n'
	@printf -- "  sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)"
