#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY="${red} ↯"
SCM_THEME_PROMPT_CLEAN="${bold_green} √"
SCM_THEME_PROMPT_PREFIX="${normal}▪["
SCM_THEME_PROMPT_SUFFIX="${normal}]"
SCM_GIT_SHOW_MINIMAL_INFO=true
GIT_THEME_PROMPT_DIRTY="${red} ↯"
GIT_THEME_PROMPT_CLEAN="${bold_green} √"
GIT_THEME_PROMPT_PREFIX="${normal}▪["
GIT_THEME_PROMPT_SUFFIX="${normal}]"


function prompt_command() {
	PS1="${normal}[${bold_cyan}\w${normal}]${normal}$(scm_prompt_info)$(virtualenv_prompt)${reset_color}${normal}▪╼ "
  }

safe_append_prompt_command prompt_command
