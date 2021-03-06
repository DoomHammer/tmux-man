#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${CURRENT_DIR}/helpers.sh"

if [[ "$2" == "" ]]; then
  set -- m $1
fi

readonly _cmd="$1"
shift
declare -A cmd_map

cmd_map["m"]="man"
cmd_map["a"]="ansible-doc"
cmd_map["r"]="rfc"
cmd_map["h"]="httpdoc"

readonly man_size="$(get_tmux_option "@man-size" "10")"
readonly man_orientation="$(get_tmux_option "@man-orientation" "")"
readonly shell_interactive="$(get_tmux_option "@man-shell-interactive" "off")"

if [[ ! -z "$man_orientation" ]]; then
  orient="-$man_orientation"
fi

if [[ "${man_size: -1}" == "%" ]]; then
  size="-p ${man_size%\%}"
else
  size="-l ${man_size}"
fi

if cmd_exists "${cmd_map["$_cmd"]}"; then
  if [[ "$shell_interactive" == "on" ]]; then
    cmd="${SHELL} -i -c \\\"${cmd_map["$_cmd"]} $@\\\""
  else
    cmd="${cmd_map["$_cmd"]} $@ | less -R"
  fi
  tmux split-window $size $orient "eval $cmd"
else
  display_msg "$_cmd not found in your PATH."
fi

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
