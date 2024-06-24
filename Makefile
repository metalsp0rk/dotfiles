SHELL := zsh -euo pipefail -c

RED := \033[0;31m
NC := \033[0m

assert-config:
	@x=""; if [ -z "$${config+x}" ]; then \
		echo "missing variable for 'config'" 1>&2; \
		exit 1; \
	fi

assert-stow_configs:
	@[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
	x=""; if [ -z "$${stow_configs+x}" ]; then \
		echo "missing environment for 'stow_configs'" 1>&2; \
		exit 1; \
	fi

adopt-config: assert-config
	@stow -v --adopt $${config}; \
	[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
	x=""; if [ -z "$${stow_configs+x}" ]; then \
		echo "export stow_configs=${config}" > ~/.zenv.d/stow.env; \
		echo "enabling config ${config}"; \
		exit 0; \
	fi; \
	if echo "$${stow_configs}" | grep "$${config}">/dev/null; then \
		echo "config already enabled"; \
		exit 0; \
	fi; \
	echo "enabling config ${config}"; \
	echo "export stow_configs=$${stow_configs},$${config}" > ~/.zenv.d/stow.env; \
	source ~/.zenv.d/stow.env



install-base:
	@mkdir ~/.zenv.d/ || true
	@mkdir -pv ~/.local/stow-run.d/ || true
	@sudo pacman -S stow

install: assert-stow_configs
	@source ~/.zenv.d/stow.env; \
	for i in $$(echo $$stow_configs | sed "s/,/ /g"); do \
		echo "Stowing $$i"; \
		stow -S -v $$i; \
	done

uninstall: assert-stow_configs
	@source ~/.zenv.d/stow.env; \
	for i in $$(echo $$stow_configs | sed "s/,/ /g"); do \
		stow -v -D $$i; \
	done

update: assert-stow_configs
	@source ~/.zenv.d/stow.env; \
	for i in $$(echo $$stow_configs | sed "s/,/ /g"); do \
		echo "$$i"; \
		stow -R -v $$i; \
	done

add:
	@[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
	x=""; if [ -z "$${stow_configs+x}" ]; then \
		echo "export stow_configs=${config}" > ~/.zenv.d/stow.env; \
		echo "enabling config ${config}"; \
		stow -S -v $${config}; \
		exit 0; \
	fi; \
	if echo "$${stow_configs}" | grep "$${config}">/dev/null; then \
		echo "config already enabled"; \
		exit 0; \
	fi; \
	echo "enabling config ${config}"; \
	echo "export stow_configs=$${stow_configs},$${config}" > ~/.zenv.d/stow.env; \
	stow -v -S $${config}; \
	source ~/.zenv.d/stow.env

delete: rm
remove: rm
rm: assert-config
	@[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
	if echo "$${stow_configs}" | grep "$${config}">/dev/null; then \
		echo "disabling config ${config}"; \
		echo "export stow_configs=$$(echo $${stow_configs} | sed -E "s/$${config}[,]?//g")" > ~/.zenv.d/stow.env; \
		echo "destowing..."; \
		stow -D $${config}; \
		exit 0; \
	fi; \
	echo "config already disabled"; \

enabled: assert-stow_configs
	@[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
	echo "enabled: "; \
	for config in $$(echo $$stow_configs | sed "s/,/ /g"); do \
		echo " - $${config}"; \
	done;

configure: assert-stow_configs
	@[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
	echo "running configuration scripts..."; \
	for config in $$(echo $$stow_configs | sed "s/,/ /g"); do \
		if [ -f "$${HOME}/.local/stow-run.d/$${config}.sh" ]; then \
			echo "${RED}Running $${config}.sh ${NC}"; \
			~/.local/stow-run.d/$${config}.sh; \
		fi; \
	done; \

###############################################################################
# BEGIN: Boilerplate and makefile-target `help` and `list`:
###############################################################################
# This causes `make help` and `make list` to publish all the make-target names
# to stdout.  This mostly works correctly even with usage of makefile-includes.
.PHONY: no_targets__ list
no_targets__:
_help-helper:
	@sh -c "\
	$(MAKE) -p no_targets__ | \
	awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);\
	for(i in A)print A[i]}' | grep -v '__\$$' | grep -v '\[' | sort"

help:
	$(call _announce_target, $@, listing makefile targets)
	@make _help-helper \
	| python3 -c"\
	import sys; \
	[print(x.strip()) for x in sys.stdin.readlines() \
	if x.strip() not in 'Makefile list fail i in not if else for'.split() \
	and not any([x.startswith(y) for y in 'NotImplementedError qassert assert range('.split()])]"
