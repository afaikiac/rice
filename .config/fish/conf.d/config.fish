if status is-interactive

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
    pyenv init --no-rehash - | source
    pyenv virtualenv-init - | source
  end

  if type -q "keychain"
    keychain --dir "$XDG_RUNTIME_DIR" --eval --quiet id_ed25519_github | source
  end

  if test -f "/opt/mambaforge/etc/fish/conf.d/conda.fish"
    cat "/opt/mambaforge/etc/fish/conf.d/conda.fish" | source
  end

  if test -f "/opt/mambaforge/etc/fish/conf.d/mamba.fish"
    cat "/opt/mambaforge/etc/fish/conf.d/mamba.fish" | source
  end

end
