  ## spaceship theme
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX="%F{008}["
SPACESHIP_PROMPT_DEFAULT_SUFFIX="%F{008}]"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SYMBOL="> "
SPACESHIP_CHAR_SYMBOL_ROOT="# "
SPACESHIP_VI_MODE_SUFFIX=" "
SPACESHIP_VI_MODE_PREFIX="%F{008}╰╼ "
SPACESHIP_VI_MODE_INSERT=">>"
SPACESHIP_VI_MODE_NORMAL="<<"
SPACESHIP_DIR_PREFIX="%F{008}["
SPACESHIP_DIR_SUFFIX="%F{008}]"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_PREFIX="…/"
SPACESHIP_DIR_COLOR="008"
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_PREFIX="%F{008}["
SPACESHIP_GIT_SUFFIX="%F{008}]"
SPACESHIP_EXEC_TIME_PREFIX="%F{008}["
SPACESHIP_EXEC_TIME_SUFFIX="%F{008}]"
SPACESHIP_EXEC_TIME_ELAPSED=1

  ## sections
SPACESHIP_PROMPT_ORDER=(
	async         # Async jobs indicator
	time          # Time stamps section
	user          # Username section
	dir           # Current directory section
	host          # Hostname section
	git           # Git section (git_branch + git_status)
#	hg            # Mercurial section (hg_branch  + hg_status)
#	package       # Package version
	node          # Node.js section
#	bun           # Bun section
#	deno          # Deno section
#	ruby          # Ruby section
	python        # Python section
#	elm           # Elm section
#	elixir        # Elixir section
#	xcode         # Xcode section
#	swift         # Swift section
#	golang        # Go section
#	php           # PHP section
#	rust          # Rust section
#	haskell       # Haskell Stack section
#	java          # Java section
#	lua           # Lua section
#	dart          # Dart section
#	julia         # Julia section
#	crystal       # Crystal section
#	docker        # Docker section
#	aws           # Amazon Web Services section
#	gcloud        # Google Cloud Platform section
	venv          # virtualenv section
#	conda         # conda virtualenv section
#	dotnet        # .NET section
#	kubectl       # Kubectl context section
#	terraform     # Terraform workspace section
#	ibmcloud      # IBM Cloud section
	exec_time     # Execution time
	line_sep      # Line break
#	battery       # Battery level and status
	vi_mode			# Vi-mode indicator
	jobs          # Background jobs indicator
	exit_code     # Exit code section
	char          # Prompt character
)

eval spaceship_vi_mode_enable
