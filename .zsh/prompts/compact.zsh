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
case ${UID} in
0)
	PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
	PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
	SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
	;;
*)
	PROMPT="%{${fg[red]}%}$(echo ${USER%%.*} | tr '[a-z]' '[A-Z]'):%(5~,%-2~/.../%2~,%~)%%%{${reset_color}%}%b "
	PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
	SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
	RPROMPT="%1(v|%F{green}%1v%2v%f|)${vcs_info_git_pushed}${reset}"
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
		PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
	;;
esac

