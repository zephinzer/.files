help:
	@echo 'this Makefile administers a development setup to fuck around with'
	@echo '- '
	@echo 'make:'
	@echo '  create_cluster - creates a kubernetes cluster'
	@echo '  create_compose - creates a docker-compose environment'
	@echo '  delete_cluster - destroys the kubernetes cluster'
	@echo '  delete_compose - destroys the docker-compose environment'

create_cluster:
	kind create cluster \
		--name zdotfiles \
		--config ./kind.config.yaml

create_compose:
	docker-compose up -d

delete_cluster:
	kind delete cluster \
		--name zdotfiles

delete_compose:
	docker-compose down --rm
