if status is-interactive

  # the bindings for !! and !$
  if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
  else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
  end

end
