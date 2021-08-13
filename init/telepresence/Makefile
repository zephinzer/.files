APP_ID=telepresence
VERSION=2.4.0
-include ../Makefile

install_linux:
	# sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	# sudo chown $(USER):root -R /opt/$(APP_ID)
	# curl -Lo /opt/$(APP_ID)/$(VERSION)/$(APP_ID) \
	# 	"https://app.getambassador.io/download/tel2/linux/amd64/$(VERSION)/telepresence"
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
	