if status is-interactive

  # remove greeting    
  set -U fish_greeting

  fish_vi_key_bindings

  # emulates vim's cursor shape behavior
  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace_one underscore
  set fish_cursor_visual block

  if type -q "zoxide"
    zoxide init fish --cmd cd | source
  end

  # changing "ls" to "exa"
  if type -q "exa"
    alias ls='exa -al --color=always --group-directories-first' # my preferred listing
    alias lt='exa -aT --color=always --group-directories-first' # tree listing
    alias l.='exa -a | egrep "^\."'
  end

  # lf
  if type -q "lf"
    alias lf="lfcd"
  end

  # the bindings for !! and !$
  if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
  else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
  end
  
  # pyenv support
  if type -q "pyenv"
    pyenv init - | source
    pyenv virtualenv-init - | source
  end
  
end
