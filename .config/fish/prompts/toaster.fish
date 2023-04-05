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
  set -l pwd (prompt_pwd)
  set -l base (basename "$pwd")
  if test $pwd = "~"
    echo -n 'ᕕ(⌐■_■)ᕗ ♪♬'
  else
    set -l expr "s|//|/|g"
    echo -n (echo "$pwd" | sed -e $expr)
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
    __toaster_color_echo $argv[2] "彡ミ"
  end
end

function __toaster_git_status_icons
  set -l git_status (__toaster_git_status_codes)

  __toaster_rainbow $git_status $__toaster_color_pink 'D'
  __toaster_rainbow $git_status $__toaster_color_orange 'R'
  __toaster_rainbow $git_status $__toaster_color_white 'C'
  __toaster_rainbow $git_status $__toaster_color_green 'A'
  __toaster_rainbow $git_status $__toaster_color_blue 'U'
  __toaster_rainbow $git_status $__toaster_color_lilac 'M'
  __toaster_rainbow $git_status $__toaster_color_grey '?'
end

function __toaster_git_status
  # In git
  if test -n (__toaster_git_branch_name)

    __toaster_color_echo $__toaster_color_blue " git"
    __toaster_color_echo $__toaster_color_white ":"(__toaster_git_branch_name)

    if test -n (__toaster_git_status_codes)
      __toaster_color_echo $__toaster_color_pink ' ●'
      __toaster_color_echo $__toaster_color_white ' [^._.^]ﾉ'
      __toaster_git_status_icons
    else
      __toaster_color_echo $__toaster_color_green ' ○'
    end
  end
end

function fish_prompt
  __toaster_color_echo $__toaster_color_blue "# "
  __toaster_color_echo $__toaster_color_purple (__toaster_current_folder)
  __toaster_git_status
  echo
  __toaster_color_echo $__toaster_color_pink "\$ "
end
