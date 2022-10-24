SHELL := zsh -euo pipefail -c

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

install-base:
	stow base

install: assert-stow_configs
	stow

uninstall: assert-stow_configs
	stow -D

update: assert-stow_configs
	stow -r

add:
	@[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
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

delete: rm
remove: rm
rm: assert-config
	@[ -f "$${HOME}/.zenv.d/stow.env" ] && source ~/.zenv.d/stow.env; \
	if echo "$${stow_configs}" | grep "$${config}">/dev/null; then \
		echo "disabling config ${config}"; \
		echo "export stow_configs=$$(echo $${stow_configs} | sed -E "s/$${config}[,]?//g")" > ~/.zenv.d/stow.env; \
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
		echo "Running $${config}.sh"; \
		~/.local/stow-run.d/$${config}.sh; \
	done; \
