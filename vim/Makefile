ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

VIM_CONFIG_ROOT = $(HOME)/.config/vim
BUNDLES_DIR = $(VIM_CONFIG_ROOT)/bundles
COLORS_DIR = $(VIM_CONFIG_ROOT)/colors
AUTOLOAD_DIR = $(VIM_CONFIG_ROOT)/autoload
SRC_DIR = $(VIM_CONFIG_ROOT)/src
THEME_DIR = $(VIM_CONFIG_ROOT)/themes

CREATE_TARGET_DIRS := $(VIM_CONFIG_ROOT) $(BUNDLES_DIR) $(COLORS_DIR) $(AUTOLOAD_DIR) $(SRC_DIR) $(THEME_DIR)

DEIN_FILES := dein.toml dein_lazy.toml

.DEFAULT_GOAL := help

.PHONY: dir
dir: ## Creates a directory related to the Fish shell
	@echo 'Create directories'
	@$(foreach dir,$(CREATE_TARGET_DIRS),$(shell [ ! -d $(dir)] && mkdir -p $(dir) || true))

.PHONY: link
link: ## Creates a symbolic link for configuration files
	[ ! -f $(HOME)/.vimrc ] && ln -s $(ROOT)/.vimrc $(HOME)/.vimrc || true
	@$(foreach file,$(DEIN_FILES),$(shell [ ! -f $(VIM_CONFIG_ROOT)/$(file)] && ln -s $(ROOT)/$(file) $(VIM_CONFIG_ROOT)/$(file) || true))

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
