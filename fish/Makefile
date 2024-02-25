ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
FISH_CONFIG_ROOT := $(HOME)/.config/fish
CONFIG_DIR := $(FISH_CONFIG_ROOT)/conf.d
FUNCTION_DIR := $(FISH_CONFIG_ROOT)/functions

.DEFAULT_GOAL := help

.PHONY: dir
dir: ## Creates a directory related to the Fish shell
	[ ! -d $(FISH_CONFIG_ROOT) ] && mkdir -p $(FISH_CONFIG_ROOT) || true
	[ ! -d $(CONFIG_DIR) ] && mkdir -p $(CONFIG_DIR) || true
	[ ! -d $(FUNCTION_DIR) ] && mkdir -p $(FUNCTION_DIR) || true

.PHONY: link
link: ## Creates a symbolic link for configuration files
	[ ! -f $(CONFIG_DIR)/alias.fish ] && ln -s $(ROOT)/alias.fish $(CONFIG_DIR)/alias.fish || true

.PHONY: install-fisher
install-fisher: ## Installs fisher
	[ ! -f $(FUNCTION_DIR)/fisher.fish ] && curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o $(FUNCTION_DIR)/fisher.fish || true

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
