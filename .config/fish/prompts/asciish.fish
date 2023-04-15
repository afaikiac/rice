set __asciish_color_black   brwhite
set __asciish_color_green   green
set __asciish_color_yellow  bryellow
set __asciish_color_blue    blue
set __asciish_color_magenta magenta
set __asciish_color_cyan    cyan
set __asciish_color_gray    white

function __asciish_color_echo
  set_color $argv[1]
  if test (count $argv) -eq 2
    printf "%s" $argv[2]
  end
end

function __asciish_random_emoji
  set -l emojis \
    "ᕕ(⌐■_■)ᕗ ♪♬" "(¬‿¬)" "(⌐■_■)" "ಠ_ಠ" "(╯°□°)╯︵ ┻━┻" "(｡◕‿◕｡)" \
    "٩(◕‿◕｡)۶" "┬─┬ノ(ಠ_ಠノ)" "(°ロ°)☝" "ฅ^•ﻌ•^ฅ" "(ง'̀-'́)ง" "(°꒳°)" \
    "(｡•̀ᴗ-)✧" "(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧" "(¬‿¬)"
  set -l emoji_count (count $emojis)
  set -l random_index (random 1 $emoji_count)
  echo $emojis[$random_index]
end

function __asciish_current_folder
  if test $PWD = $HOME
    __asciish_random_emoji
  else
    prompt_pwd
  end
end

function __asciish_background_jobs
  set -l jobs (jobs | wc -l)
  if test $jobs -gt 0
    __asciish_color_echo $__asciish_color_yellow "[$jobs jobs] "
  end
end

function __asciish_git_status_codes
  echo (git status --porcelain 2> /dev/null | sed -E "s/(^.{3}).*/\1/" | tr -d " \n")
end

function __asciish_git_branch_name
  echo (git rev-parse --abbrev-ref HEAD 2> /dev/null)
end

function __asciish_rainbow
  if echo $argv[1] | grep -q -e $argv[3]
    __asciish_color_echo $argv[2] $argv[3]
  end
end

function __asciish_git_status_icons
  set -l git_status (__asciish_git_status_codes)

  __asciish_rainbow $git_status $__asciish_color_black   "D" # Deleted
  __asciish_rainbow $git_status $__asciish_color_yellow  "R" # Renamed
  __asciish_rainbow $git_status $__asciish_color_gray    "C" # Copied
  __asciish_rainbow $git_status $__asciish_color_green   "A" # Added
  __asciish_rainbow $git_status $__asciish_color_blue    "U" # Unmerged
  __asciish_rainbow $git_status $__asciish_color_magenta "M" # Modified
  __asciish_rainbow $git_status $__asciish_color_cyan    "?" # Untracked
end

function __asciish_git_status
  if test -n (__asciish_git_branch_name)

    __asciish_color_echo $__asciish_color_gray " ["
    __asciish_color_echo $__asciish_color_black (__asciish_git_branch_name)
    __asciish_color_echo $__asciish_color_gray "]"

    if test -n (__asciish_git_status_codes)
      __asciish_color_echo $__asciish_color_gray " (∩｀-´)⊃━☆ﾟ.*･｡ﾟ"
      __asciish_git_status_icons
    else
      __asciish_color_echo $__asciish_color_green " ●"
    end
  end
end

function fish_prompt
  __asciish_background_jobs
  __asciish_color_echo $__asciish_color_blue "# "
  __asciish_color_echo $__asciish_color_black (__asciish_current_folder)
  __asciish_git_status
  echo
  __asciish_color_echo $__asciish_color_black "\$ "
end
