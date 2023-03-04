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

  if type -q "pyenv"
    pyenv init - | source
    pyenv virtualenv-init - | source
  end

  if type -q "keychain"
    eval $(keychain --dir "$XDG_RUNTIME_DIR" --eval --quiet id_ed25519_github)
  end

end
