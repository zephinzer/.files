APP_ID=solc
# ref https://github.com/ethereum/solidity/releases
VERSION=v0.8.13
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -Lo /opt/$(APP_ID)/$(VERSION)/$(APP_ID) \
		"https://github.com/ethereum/solidity/releases/download/${VERSION}/solc-static-linux"
	chmod 750 /opt/$(APP_ID)/$(VERSION)/$(APP_ID)
	/opt/$(APP_ID)/$(VERSION)/$(APP_ID) --version
	@printf -- 'displaying alternatives (BEFORE)...\n'
	-update-alternatives --list $(APP_ID)
	sudo update-alternatives --install /usr/bin/$(APP_ID) $(APP_ID) /opt/$(APP_ID)/$(VERSION)/$(APP_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(APP_ID)
