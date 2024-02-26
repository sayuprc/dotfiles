ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

FISH_CONFIG_ROOT := $(HOME)/.config/fish
CONFIG_DIR := $(FISH_CONFIG_ROOT)/conf.d
FUNCTION_DIR := $(FISH_CONFIG_ROOT)/functions

CREATE_TARGET_DIRS := $(FISH_CONFIG_ROOT) $(CONFIG_DIR) $(FUNCTION_DIR)
CONFIG_FILES := alias.fish

.DEFAULT_GOAL := help

.PHONY: dir
dir: ## Creates a directory related to the Fish shell
	@echo 'Create directories'
	@$(foreach dir,$(CREATE_TARGET_DIRS),$(shell [ ! -d $(dir) ] && mkdir -p $(dir) || true))

.PHONY: link
link: ## Creates a symbolic link for configuration files
	@echo 'Create symbolic link'
	@$(foreach file,$(CONFIG_FILES),$(shell [ ! -f $(CONFIG_DIR)/$(file) ] && ln -s $(ROOT)/$(file) $(CONFIG_DIR)/$(file) || true))

.PHONY: install-fisher
install-fisher: ## Installs fisher
	[ ! -f $(FUNCTION_DIR)/fisher.fish ] && curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o $(FUNCTION_DIR)/fisher.fish || true

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
