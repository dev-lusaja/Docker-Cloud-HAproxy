.DEFAULT_GOAL := help

PROJECT=externalproject

install: ## install the project
	@make up-external-app
	@make up-lb

uninstall: ## remove the project
	@make down-lb
	@make down-external-app

reload: ## reload the project
	@make restart-external-app
	@make restart-lb

up-external-app: ## up the external upp
	docker-compose -p $(PROJECT) -f external_app/docker-compose.yml up -d

up-lb: ## up docker containers
	docker-compose -f load-balancer/docker-compose.yml up -d
	sh load-balancer/hook.sh&

down-external-app: ## Stops and removes the external-app container
	docker-compose -p $(PROJECT) -f external_app/docker-compose.yml down

down-lb: ## Stops and removes the balancer container
	docker-compose -f load-balancer/docker-compose.yml down

restart-external-app: ## Restart external-app container
	docker-compose -f external_app/docker-compose.yml restart

restart-lb: ## Restart balancer container
	docker-compose -f load-balancer/docker-compose.yml restart

ssh: ## Connect to container
	docker exec -it $(CONTAINER) bash

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
