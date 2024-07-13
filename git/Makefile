DEFAULT_GOAL := help

ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

GIT_ROOT := $(HOME)/.config/git
GIT_CONF := $(GIT_ROOT)/conf.d

USER_NAME ?= $(USER)
EMAIL ?= email@example.com

.DEFAULT_GOAL := help

.PHONY: all
all: ## Automatically perform all steps
	make -s dir
	make -s user-conf
	make -s link

.PHONY: dir
dir: ## Creates a directory related to the Fish shell
	@echo 'Create directories'
	@[ ! -d $(GIT_ROOT) ] && mkdir -p $(GIT_ROOT) || true

.PHONY: user-conf
user-conf: ## Create a user.conf
	[ ! -f $(ROOT)/conf.d/user.conf ] && cp $(ROOT)/user.conf.example $(ROOT)/conf.d/user.conf || true
	sed -i -e 's/##NAME##/$(USER_NAME)/' $(ROOT)/conf.d/user.conf
	sed -i -e 's/##EMAIL##/$(EMAIL)/' $(ROOT)/conf.d/user.conf

.PHONY: link
link: ## Creates a symbolic link for configuration files
	[ ! -f $(HOME)/.gitconfig ] && ln -s $(ROOT)/.gitconfig $(HOME)/.gitconfig || true
	[ ! -f $(GIT_ROOT)/.gitmessage ] && ln -s $(ROOT)/.gitmessage $(GIT_ROOT)/.gitmessage || true
	[ ! -f $(GIT_CONF) ] && ln -s $(ROOT)/conf.d $(GIT_CONF)

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
