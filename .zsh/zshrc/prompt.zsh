#######################
# prompt settings     #
# 設定内容はpromptsへ #
#######################
__MY_PROMPTS__=${HOME}/.zsh/prompts
__DEFAULT__="fullwidth"

__DEFAULT_PROMPT__=$PROMPT
__DEFAULT_PROMPT2__=$PROMPT2
__DEFAULT_SPROMPT__=$SPROMPT
__DEFAULT_RPROMPT__=$RPROMPT

chprompt(){
	local prompt_path="${__MY_PROMPTS__}/$1"
	if [ ! -e $prompt_path ]; then
		prompt_path="${prompt_path}.zsh"
	fi
	if [ -e $prompt_path ]; then
		precmd_functions=""
		unsetopt prompt_subst
		unsetopt prompt_percent
		unsetopt transient_rprompt
		PROMPT=$__DEFAULT_PROMPT__
		PROMPT2=$__DEFAULT_PROMPT2__
		SPROMPT=$__DEFAULT_SPROMPT__
		RPROMPT=$__DEFAULT_RPROMPT__
		source $prompt_path
	fi
}
chprompt ${__DEFAULT__}
unset __DEFAULT__
