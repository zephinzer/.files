deploy:
	./.scripts/deploy-to-system
retrieve:
	./.scripts/get-from-system
deploy_scripts:
	sudo ./.scripts/deploy-to-bin
deploy_bin:
	sudo ./.scripts/deploy-to-usr-bin
deploy-docker:
	@$(MAKE) deploy_docker
deploy_docker:
	docker-compose --file ./deploy/docker-compose/docker-compose.yml up -d --build --remove-orphans
