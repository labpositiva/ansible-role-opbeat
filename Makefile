.PHONY: build deploy lint test functions help
.DEFAULT_GOAL := help

DOCKER_NETWORK = ansible-rol-opbeat_network
PROYECT_NAME = ansible-rol-opbeat

# Configuration.
SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
MESSAGE="༼ つ ◕_◕ ༽つ"
SCRIPT_DIR = $(ROOT_DIR)/script

# Bin scripts
BUILD = $(shell) $(SCRIPT_DIR)/build.sh
CLEAN = $(shell) $(SCRIPT_DIR)/clean.sh
DOCUMENTATION = $(shell) $(SCRIPT_DIR)/documentation.sh
DOWN = $(shell) $(SCRIPT_DIR)/down.sh
DEPLOY = $(shell) $(SCRIPT_DIR)/deploy.sh
PYENV = $(shell) $(SCRIPT_DIR)/pyenv.sh
INSTALL = $(shell) $(SCRIPT_DIR)/install.sh
LIST = $(shell) $(SCRIPT_DIR)/list.sh
LINT = $(shell) $(SCRIPT_DIR)/lint.sh
TEST = $(shell) $(SCRIPT_DIR)/test.sh
STOP =  $(shell) $(SCRIPT_DIR)/stop.sh
SETUP =  $(shell) $(SCRIPT_DIR)/setup.sh
UP = $(shell) $(SCRIPT_DIR)/up.sh

build:  ## Build docker container by env
	make clean
	echo "Building environment: ${env}"
	@if [ "${env}" == '' ]; then \
		$(BUILD) || exit 2; \
	fi
	$(BUILD) "${env}"

clean: ## clean Files compiled
	$(CLEAN)

documentation: ## Make Documentation
	make clean
	$(DOCUMENTATION)

down: ## remove containers docker by env
	make clean
	echo "Down Services: ${env}"
	@if [ "${env}" == '' ]; then \
		$(DOWN) || exit 2; \
	fi
	$(DOWN) "${env}"

environment: ## Make environment for developer
	$(PYENV)

env: ## Show envs available
	@echo $(MESSAGE) "Environments:"
	@echo "dev"
	@echo "test"
	@echo "stage"

install: ## Install with var env Dependences
	make clean
	echo "Deployment environment: ${env}"
	@if [ "${env}" == '' ]; then \
		$(INSTALL) || exit 2; \
	fi
	$(INSTALL) "${env}"

list: ## List of current active services by env
	make clean
	echo "List Services: ${env}"
	@if [ "${env}" == '' ]; then \
		$(LIST) || exit 2; \
	fi
	$(LIST) "${env}"

lint: ## Clean files unnecesary
	make clean
	$(LINT)

test: ## make test
	make clean
	$(TEST)

up: ## Up application by env
	make clean
	make verify_network &> /dev/null
	echo "Up Application environment: ${env}"
	@if [ "${env}" == '' ]; then \
		$(UP) || exit 2; \
	fi
	$(UP) "${env}"

restart: ## Reload services
	docker-compose restart

ssh: ## Connect to container
	docker exec -it $(CONTAINER) bash

stop: ## stop containers docker by env
	make clean
	echo "stop Services: ${env}"
	@if [ "${env}" == '' ]; then \
		$(STOP) || exit 2; \
	fi
	$(STOP) "${env}"

setup: ## Install dependences initial
	make clean
	$(SETUP)

verify_network: ## Verify network
	@if [ -z $$(docker network ls | grep $(DOCKER_NETWORK) | awk '{print $$2}') ]; then\
		(docker network create $(DOCKER_NETWORK));\
	fi

help: ## Show help text
	@echo $(MESSAGE) "Commands"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'
