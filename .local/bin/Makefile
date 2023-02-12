uninstall-all-py-pkgs:
	pip3 freeze | awk -v FS='==' '{print $1}' | xargs pip3 uninstall --yes

init-config-wget:
	echo hsts-file \= "$XDG_CACHE_HOME"/wget-hsts > "$WGETRC"
