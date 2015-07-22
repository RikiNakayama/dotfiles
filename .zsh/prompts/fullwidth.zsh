## Default shell configuration
#
# set prompt
#

setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt

autoload colors
colors

# バージョン管理
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '%s://%r/%b/'
zstyle ':vcs_info:*' actionformats '%s://%r/%b/#%a'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
	zstyle ':vcs_info:git:*' check-for-changes true
	zstyle ':vcs_info:git:*' stagedstr "+"
	zstyle ':vcs_info:git:*' unstagedstr "-"
	zstyle ':vcs_info:git:*' formats '%s://%r/%b/%c%u'
	zstyle ':vcs_info:git:*' actionformats '%s://%r/%b/#%a%c%u'
fi

function _update_vcs_info_msg() {
psvar=()
LANG=en_US.UTF-8 vcs_info
psvar[2]=$(_git_not_pushed)
[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

function _git_not_pushed()
{
	if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
		head="$(git rev-parse HEAD)"
		for x in $(git rev-parse --remotes)
		do
			if [ "$head" = "$x" ]; then
				return 0
			fi
		done
		echo "#unpushed"
	fi
	return 0
}


__prompt_pwd="%{${fg[red]}%}%d%{${reset_color}%}"
__prompt_host="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]')%{${reset_color}%}"
__prompt_user="%{${fg[red]}%}$(echo ${USER%%.*} | tr '[a-z]' '[A-Z]')%{${reset_color}%}"
__prompt_jobs="%B%{${fg[green]}%}[%j]%{${reset_color}%}%b"
__prompt_status="%B%(?.%{${fg[green]}%}[  O K  ].%{${fg[red]}%}[ ERROR ])%{${reset_color}%}%b"
__prompt_tty="%B%{${fg[cyan]}%}($(tty | sed -e "s/\/dev\///"))%{${reset_color}%}%b"
__prompt_date="%D{%Y/%m/%d %H:%M}"
__prompt_vcs="%1(v|%F{green}%1v%2v%f|)${vcs_info_git_pushed}${reset}"

count_prompt_characters() {
    print -n -P -- "$1" | sed -e $'s/\e\[[0-9;]*m//g' | wc -m | sed -e 's/ //g'
}
function update_prompt() {
	local margin=8
	local name="${__prompt_host}"
	local current="%{${fg[red]}%}:${__prompt_pwd}%{${reset_color}%}"
	local params="${__prompt_jobs}${__prompt_tty}"
	local statusline="${__prompt_date} ${__prompt_status}"

	# local virtualenvrc=`pwd`/.virtualenvrc
	# if [ -f $virtualenvrc ]; then
		# if which deactivate >/dev/null &>1; then
			# deactivate
		# fi
		# source $virtualenvrc
	# fi

	if [ ! -z "$VIRTUAL_ENV" ]; then
		current+=" workon (%B%{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{${reset_color}%}%b)"
	fi

	local left_length=$(count_prompt_characters "${name}${current}")
	local right_length=$(count_prompt_characters $params)
	# local status_length=$(count_prompt_characters $__prompt_status)
	local status_length=$(count_prompt_characters $statusline)

	local bar=${(l:$(($COLUMNS - $status_length)):: :)}${statusline}$'\n'
	# local bar=${(l:$(($COLUMNS - $(count_prompt_characters $__prompt_status))):: :)}${__prompt_status}$'\n'
	if (($COLUMNS - $left_length - $right_length < $margin)); then
		current="%(5~,%-2~/.../%2~,%~)"
		left_length=$(count_prompt_characters "${name}${current}")
	fi
	bar=${bar}${name}${current}
	local rest_width=$(($COLUMNS - $left_length - $right_length))
	if (($rest_width > $margin)); then
		bar=${bar}${(l:${rest_width}:: :)}${params}
	fi
	PROMPT=${bar}$'\n'${__prompt_user}" %B%{${fg[red]}%}%#%{${reset_color}%}%b "
	PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
	SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
	RPROMPT=${__prompt_vcs}
}
precmd_functions+=update_prompt
