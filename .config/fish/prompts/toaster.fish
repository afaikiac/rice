set __toaster_color_orange bryellow
set __toaster_color_blue   blue
set __toaster_color_green  green
set __toaster_color_yellow yellow
set __toaster_color_pink   brwhite
set __toaster_color_grey   cyan
set __toaster_color_white  white
set __toaster_color_purple magenta
set __toaster_color_lilac  brmagenta

function __toaster_color_echo
  set_color $argv[1]
  if test (count $argv) -eq 2
    echo -n $argv[2]
  end
end

function __toaster_current_folder
  if test $PWD = $HOME
    echo -n 'ᕕ(⌐■_■)ᕗ ♪♬'
  else
    prompt_pwd
  end
end

function __toaster_git_status_codes
  echo (git status --porcelain 2> /dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n')
end

function __toaster_git_branch_name
  echo (git rev-parse --abbrev-ref HEAD 2> /dev/null)
end

function __toaster_rainbow
  if echo $argv[1] | grep -q -e $argv[3]
    __toaster_color_echo $argv[2] $argv[3]
  end
end

function __toaster_git_status_icons
  set -l git_status (__toaster_git_status_codes)

  __toaster_rainbow $git_status $__toaster_color_pink 'D'   # Deleted
  __toaster_rainbow $git_status $__toaster_color_orange 'R' # Renamed
  __toaster_rainbow $git_status $__toaster_color_white 'C'  # Copied
  __toaster_rainbow $git_status $__toaster_color_green 'A'  # Added
  __toaster_rainbow $git_status $__toaster_color_blue 'U'   # Unmerged
  __toaster_rainbow $git_status $__toaster_color_lilac 'M'  # Modified
  __toaster_rainbow $git_status $__toaster_color_grey '?'   # Untracked
end

function __toaster_git_status
  # In git
  if test -n (__toaster_git_branch_name)

    __toaster_color_echo $__toaster_color_white ' ['
    __toaster_color_echo $__toaster_color_pink (__toaster_git_branch_name)
    __toaster_color_echo $__toaster_color_white ']'

    if test -n (__toaster_git_status_codes)
      __toaster_color_echo $__toaster_color_white ' (∩｀-´)⊃━☆ﾟ.*･｡ﾟ'
      __toaster_git_status_icons
    else
      __toaster_color_echo $__toaster_color_green ' ヾ(-_- )ゞ'
    end
  end
end

function fish_prompt
  __toaster_color_echo $__toaster_color_blue "# "
  __toaster_color_echo $__toaster_color_pink (__toaster_current_folder)
  __toaster_git_status
  echo
  __toaster_color_echo $__toaster_color_pink "\$ "
end
