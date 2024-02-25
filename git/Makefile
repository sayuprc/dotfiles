ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
GIT_CONFIG_ROOT := $(HOME)/.config/git
CONF_DIR := $(GIT_CONFIG_ROOT)/conf.d

USER_NAME ?= $(USER)
EMAIL ?= email@example.com

.DEFAULT_GOAL := help

.PHONY: dir
dir: ## Creates a directory related to the Fish shell
	[ ! -d $(GIT_CONFIG_ROOT) ] && mkdir -p $(GIT_CONFIG_ROOT) || true
	[ ! -d $(CONF_DIR) ] && mkdir -p $(CONF_DIR) || true

.PHONY: user-conf
user-conf: ## Create a user.conf
	[ ! -f $(ROOT)/user.conf ] && cp $(ROOT)/user.conf.example $(ROOT)/user.conf || true
	sed -i -e 's/##NAME##/$(USER_NAME)/' $(ROOT)/user.conf
	sed -i -e 's/##EMAIL##/$(EMAIL)/' $(ROOT)/user.conf

.PHONY: link
link: ## Creates a symbolic link for configuration files
	[ ! -f $(HOME)/.gitconfig ] && ln -s $(ROOT)/.gitconfig $(HOME)/.gitconfig || true
	[ ! -f $(GIT_CONFIG_ROOT)/.gitmessage ] && ln -s $(ROOT)/.gitmessage $(GIT_CONFIG_ROOT)/.gitmessage || true
	[ ! -f $(CONF_DIR)/user.conf ] && ln -s $(ROOT)/conf.d/user.conf $(CONF_DIR)/user.conf || true
	[ ! -f $(CONF_DIR)/alias.conf ] && ln -s $(ROOT)/conf.d/alias.conf $(CONF_DIR)/alias.conf || true
	[ ! -f $(CONF_DIR)/delta.conf ] && ln -s $(ROOT)/conf.d/delta.conf $(CONF_DIR)/delta.conf || true

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
