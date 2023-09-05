if status is-interactive

  if type -q "exa"
    alias ls='exa -al --color=always --group-directories-first'
    alias lt='exa -aT --color=always --group-directories-first' # tree listing
    alias l.='exa -a | egrep "^\."'
  end

  if type -q "lf"
    alias lf="lfcd"
  end

  if type -q "gitui"
    and type -q "yadm"
    alias yadmui="gitui -d $(yadm worktree list -v | awk '{print $1}')"
  end

  if type -q "fzf"
    and type -q "camb"
    alias cambl="camb l | fzf --preview 'camb {}'"
  end

  if type -q "yarn"
    alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
  end

  alias trash="gio trash"

end
