if status is-interactive

  abbr -a --position anywhere S  systemctl
  abbr -a --position anywhere SI systemctl status
  abbr -a --position anywhere SS systemctl start
  abbr -a --position anywhere SE systemctl enable
  abbr -a --position anywhere SD systemctl disable
  abbr -a --position anywhere SR systemctl restart

end
