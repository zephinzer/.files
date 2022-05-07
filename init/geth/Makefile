APP_ID=geth
VERSION=1.10.17
HASH=25c9b49f
-include ../Makefile

install_linux:
	sudo mkdir -p /opt/$(APP_ID)/$(VERSION)-$(HASH)
	sudo chown $(USER):root -R /opt/$(APP_ID)
	curl -fL "https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-$(VERSION)-$(HASH).tar.gz" \
		| tar xfz - -C "/opt/$(APP_ID)/$(VERSION)-$(HASH)/"
	mv /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)/abigen /opt/$(APP_ID)/$(VERSION)-$(HASH)/abigen
	/opt/$(APP_ID)/$(VERSION)-$(HASH)/abigen --version
	@$(MAKE) .install_linux BIN_ID=abigen
	mv /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)/bootnode /opt/$(APP_ID)/$(VERSION)-$(HASH)/bootnode
	/opt/$(APP_ID)/$(VERSION)-$(HASH)/bootnode --help
	@$(MAKE) .install_linux BIN_ID=bootnode
	mv /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)/clef /opt/$(APP_ID)/$(VERSION)-$(HASH)/clef
	/opt/$(APP_ID)/$(VERSION)-$(HASH)/clef --version
	@$(MAKE) .install_linux BIN_ID=clef
	mv /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)/evm /opt/$(APP_ID)/$(VERSION)-$(HASH)/evm
	/opt/$(APP_ID)/$(VERSION)-$(HASH)/evm --version
	@$(MAKE) .install_linux BIN_ID=evm
	mv /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)/geth /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth
	/opt/$(APP_ID)/$(VERSION)-$(HASH)/geth version
	@$(MAKE) .install_linux BIN_ID=geth
	mv /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)/puppeth /opt/$(APP_ID)/$(VERSION)-$(HASH)/puppeth
	/opt/$(APP_ID)/$(VERSION)-$(HASH)/puppeth --version
	@$(MAKE) .install_linux BIN_ID=puppeth
	mv /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)/rlpdump /opt/$(APP_ID)/$(VERSION)-$(HASH)/rlpdump
	/opt/$(APP_ID)/$(VERSION)-$(HASH)/rlpdump --help
	@$(MAKE) .install_linux BIN_ID=rlpdump
	rm -rf /opt/$(APP_ID)/$(VERSION)-$(HASH)/geth-alltools-linux-amd64-$(VERSION)-$(HASH)
	chmod 750 /opt/$(APP_ID)/$(VERSION)-$(HASH)/*
	@printf -- 'displaying alternatives (BEFORE)...\n'

.install_linux:
	-update-alternatives --list $(BIN_ID)
	sudo update-alternatives --install /usr/bin/$(BIN_ID) $(BIN_ID) /opt/$(APP_ID)/$(VERSION)-$(HASH)/$(BIN_ID) $(PRIORITY)
	@printf -- 'displaying alternatives (AFTER)...\n'
	-update-alternatives --list $(BIN_ID)
