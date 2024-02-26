ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

GIT_CONFIG_ROOT := $(HOME)/.config/git
CONF_DIR := $(GIT_CONFIG_ROOT)/conf.d

CREATE_TARGET_DIRS := $(GIT_CONFIG_ROOT) $(CONFIG_DIR)
CONFIG_FILES := user.conf alias.conf delta.conf difftastic.conf

USER_NAME ?= $(USER)
EMAIL ?= email@example.com

.DEFAULT_GOAL := help

.PHONY: dir
dir: ## Creates a directory related to the Fish shell
	@echo 'Create directories'
	@$(foreach dir,$(CREATE_TARGET_DIRS),$(shell [ ! -d $(dir) ] && mkdir -p $(dir) || true))

.PHONY: user-conf
user-conf: ## Create a user.conf
	[ ! -f $(ROOT)/user.conf ] && cp $(ROOT)/user.conf.example $(ROOT)/user.conf || true
	sed -i -e 's/##NAME##/$(USER_NAME)/' $(ROOT)/user.conf
	sed -i -e 's/##EMAIL##/$(EMAIL)/' $(ROOT)/user.conf

.PHONY: link
link: ## Creates a symbolic link for configuration files
	[ ! -f $(HOME)/.gitconfig ] && ln -s $(ROOT)/.gitconfig $(HOME)/.gitconfig || true
	[ ! -f $(GIT_CONFIG_ROOT)/.gitmessage ] && ln -s $(ROOT)/.gitmessage $(GIT_CONFIG_ROOT)/.gitmessage || true
	@$(foreach file,$(CONFIG_FILES),$(shell [ ! -f $(CONF_DIR)/$(file) ] && ln -s $(ROOT)/$(file) $(CONF_DIR)/$file || true))

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
