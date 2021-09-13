APP_ID  := ventoy
VERSION := 1.0.51
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://github.com/ventoy/Ventoy/releases/download/v$(VERSION)/ventoy-$(VERSION)-linux.tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)/"
	echo '#!/bin/sh' > /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	echo '/opt/$(APP_ID)/$(VERSION)/ventoy-$(VERSION)/Ventoy2Disk.sh $$@' >> /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) --version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
