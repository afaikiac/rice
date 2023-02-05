uninstall-all-py-pkgs:
	pip3 freeze | awk -v FS='==' '{print $1}' | xargs pip3 uninstall --yes

install-py-pkgs:
	pip3 install --isolated --upgrade pdm poetry jupytext ipython	

init-config-wget:
	echo hsts-file \= "$XDG_CACHE_HOME"/wget-hsts > "$WGETRC"
