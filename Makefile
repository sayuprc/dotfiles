GIT_PATH = ./git

CONFIG_ROOT = ~/.config
CONFIG_GIT = ~/.config/git

define create_dir
	[ ! -d ${1} ] && { mkdir -p ${1}; :; } || true
endef

define copy
	{ [ ! -f ${2} ] && [ ! -d ${2} ]; } && { cp -r ${1} ${2}; :; } || true
endef

.PHONY: git
git: ${CONFIG_ROOT} ${GIT_PATH}/.gitconfig ${GIT_PATH}/.gitmessage ${GIT_PATH}/themes.gitconfig
	@$(call create_dir,${CONFIG_GIT})
	@$(call copy,${GIT_PATH}/.gitconfig,~/.gitconfig)
	@$(call copy,${GIT_PATH}/.gitmessage,${CONFIG_GIT}/.gitmessage)
	@$(call copy,${GIT_PATH}/themes.gitconfig,${CONFIG_GIT}/themes.gitconfig)

.PHONY: ${CONFIG_ROOT}
${CONFIG_ROOT}:
	@$(call create_dir,${CONFIG_ROOT})
