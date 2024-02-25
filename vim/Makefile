ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

VIM_CONFIG_ROOT = $(HOME)/.config/vim
BUNDLES_DIR = $(VIM_CONFIG_ROOT)/bundles
COLORS_DIR = $(VIM_CONFIG_ROOT)/colors
AUTOLOAD_DIR = $(VIM_CONFIG_ROOT)/autoload
SRC_DIR = $(VIM_CONFIG_ROOT)/src
THEME_DIR = $(VIM_CONFIG_ROOT)/themes

.DEFAULT_GOAL := help

.PHONY: dir
dir: ## Creates a directory related to the Fish shell
	[ ! -d $(VIM_CONFIG_ROOT) ] && mkdir -p $(VIM_CONFIG_ROOT) || true
	[ ! -d $(BUNDLES_DIR) ] && mkdir -p $(BUNDLES_DIR) || true
	[ ! -d $(COLORS_DIR) ] && mkdir -p $(COLORS_DIR) || true
	[ ! -d $(AUTOLOAD_DIR) ] && mkdir -p $(AUTOLOAD_DIR) || true
	[ ! -d $(SRC_DIR) ] && mkdir -p $(SRC_DIR) || true
	[ ! -d $(THEME_DIR) ] && mkdir -p $(THEME_DIR) || true

.PHONY: link
link: ## Creates a symbolic link for configuration files
	[ ! -f $(HOME)/.vimrc ] && ln -s $(ROOT)/.vimrc $(HOME)/.vimrc || true
	[ ! -f $(VIM_CONFIG_ROOT)/dein.toml ] && ln -s $(ROOT)/dein.toml $(VIM_CONFIG_ROOT)/dein.toml || true
	[ ! -f $(VIM_CONFIG_ROOT)/dein_lazy.toml ] && ln -s $(ROOT)/dein_lazy.toml $(VIM_CONFIG_ROOT)/dein_lazy.toml || true

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
