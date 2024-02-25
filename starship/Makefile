ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CONFIG_ROOT := $(HOME)/.config
FISH_CONFIG_DIR := $(HOME)/.config/fish/conf.d

.DEFAULT_GOAL := help

.PHONY: install
install: ## Install Starship
	curl -Ss https://starship.rs/install.sh | sh -s -- -y

.PHONY: link
link: ## Creates a symbolic link for configuration files
	[ ! -f $(CONFIG_ROOT)/starship.toml ] && ln -s $(ROOT)/starship.toml $(CONFIG_ROOT)/starship.toml || true
	[ ! -f $(FISH_CONFIG_DIR)/starship.fish ] && ln -s $(ROOT)/starship.fish $(FISH_CONFIG_DIR)/starship.fish || true

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
