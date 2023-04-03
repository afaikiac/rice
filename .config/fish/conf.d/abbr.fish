if status is-interactive

  abbr --position anywhere S  "systemctl"
  abbr SS "sudo systemctl"

  abbr pdf-merge "gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf"

  abbr docker-image-rmi-none "docker images | tail -n +2 | awk '{if (\$1==\"<none>\") print \$3}' | xargs docker image rmi -f"
  abbr docker-container-rm-all "docker container ls -a | tail -n +2 | awk '{print \$1}' | xargs docker container rm"

  abbr pip-uninstall-all "pip3 freeze | awk -v FS='==' '{print \$1}' | xargs pip3 uninstall --yes"

  abbr pyenvx-install "FILE=\"~/.local/bin/pyenvx\" bash -c \"curl -fsSl https://raw.githubusercontent.com/afaikiac/pyenvx/main/pyenvx.bash -o \$FILE && chmod +x \$FILE && echo 'pyenvx was installed!'\""

end
