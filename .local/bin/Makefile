uninstall-all-py-pkgs:
	pip3 freeze | awk -v FS='==' '{print $1}' | xargs pip3 uninstall --yes

init-config-wget:
	echo hsts-file \= "$XDG_CACHE_HOME"/wget-hsts > "$WGETRC"

install-pyenvx:
	FILE="~/.local/bin/pyenvx" bash -c "curl -fsSl https://raw.githubusercontent.com/afaikiac/pyenvx/main/pyenvx.bash -o $FILE && chmod +x $FILE && echo 'pyenvx was installed!'"
