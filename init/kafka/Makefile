APP_ID=kafka
VERSION=2.6.0
-include ../Makefile

# note: this is either 2.12 or 2.13 as of october 2020
VERSION_SCALA=2.13

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://apachemirror.sg.wuchna.com/kafka/$(VERSION)/kafka_$(VERSION_SCALA)-$(VERSION).tgz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/"
	mv /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/kafka_$(VERSION_SCALA)-$(VERSION)/* \
		/opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/
	-mv /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/kafka_$(VERSION_SCALA)-$(VERSION)/.* \
		/opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/
	rmdir /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/kafka_$(VERSION_SCALA)-$(VERSION)
	chmod 750 -R /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/bin
	ls -1 /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/bin | grep kafka- | cut -f 1 -d . | xargs -I@ sh -c 'if [ -f /usr/bin/@ ]; then sudo rm -rf /usr/bin/@; fi'
	ls -1 /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/bin | grep kafka- | cut -f 1 -d . | xargs -I{} sudo sh -c "touch /usr/bin/{} && chmod 755 /usr/bin/{} && echo '#!/bin/sh' > /usr/bin/{} && printf -- '/opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/bin/{}.sh $$' >> /usr/bin/{} && echo '@' >> /usr/bin/{}"
	ls -1 /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/bin | grep kafka- | xargs -I@ sh -c "sudo ln /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/bin/@ /usr/bin/@"
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)-scala$(VERSION_SCALA)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
