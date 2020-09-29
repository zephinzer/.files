update_installer:
	curl -Lo ./install.sh https://get.kalm.dev
	chmod 750 ./install.sh

install:
	@printf -- 'printing contexts...\n'
	@kubectl config get-contexts
	@printf -- "you are using context: \033[1m$$(kubectl config get-contexts | grep '*' | tr -s '  ' ' ' | cut -f 2 -d ' ')\033[0m\n"
	@printf -- 'sleeping for 5 seconds, press ctrl+c to cancel\n'
	@printf -- '5 seconds left...\n'
	@sleep 1
	@printf -- '4 seconds left...\n'
	@sleep 1
	@printf -- '3 seconds left...\n'
	@sleep 1
	@printf -- '2 seconds left...\n'
	@sleep 1
	@printf -- '1 seconds left...\n'
	@sleep 1
	@printf -- 'installing kalm now using ./install.sh\n'
	./install.sh
