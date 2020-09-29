define DEFAULT_PRE_HELP_TEXT
Help
^^^^

endef

define DEFAULT_HELP_TEXT


Default Makefile Usage
^^^^^^^^^^^^^^^^^^^^^^
make:
  create_compose - creates the docker service
  delete_compose - deletes the docker service

endef

ifndef HELP
HELP="Seems like the HELP variable has not been defined"
else
HELPTEXT=$(DEFAULT_PRE_HELP_TEXT)$(HELP)$(DEFAULT_HELP_TEXT)
endif

help:
	@ $(info $(HELPTEXT))

create_compose:
	docker-compose up -d

delete_compose:
	docker-compose down --rm

print_kubecontext_and_wait:
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
	@printf -- "installing ${TO_INSTALL} now using ./install.sh\n"
