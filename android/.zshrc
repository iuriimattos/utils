# by https://github.com/hctilg/root-termux
## Harden SSH proot auto-login: guard for recursion & check availability
if [ -n "$SSH_CONNECTION" ] && [ "$USER" = "iuri" ] && [ -z "$INSIDE_PROOT_UBUNTU" ]; then
    if command -v proot-distro >/dev/null 2>&1; then
        export INSIDE_PROOT_UBUNTU=1
        exec proot-distro login ubuntu --termux-home --user iuri
    fi
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# If you come from bash you might have to change your $PATH.
export PATH="${HOME}/bin":"${HOME}/.local/bin":"${PREFIX}/local/bin":"${PATH}"

# Needed to make gpg(2) work
export GPG_TTY="${TTY}"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode prompt  # asks for confirmation before updating, this is the default mode
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
## Keep zsh-syntax-highlighting LAST for correctness
plugins=(
  alias-finder
  command-not-found
  git
  node
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load OhMyZsh
source "${ZSH}/oh-my-zsh.sh"

## Optional: compaudit security notes (common on Termux/Android)
## If you get insecure directory warnings, either fix perms:
##   compaudit | xargs -r chmod g-w
## Or accept risk explicitly:
##   autoload -Uz compinit && compinit -u

# User configuration

export MANPATH="${PREFIX}/share/man":"${MANPATH}"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
## Example for robust UTF-8 behavior (kept commented for your control)
## export LANG=en_US.UTF-8
## export LC_ALL=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use lf to switch directories and bind it to CTRL+O
if [ -f "${HOME}/.config/lf/lfcd.sh" ]; then
    source "${HOME}/.config/lf/lfcd.sh"
    bindkey -s "^o" "lfcd\n" # Just change lfcd part to lf here if you don't want directory to preserve on quitting lf
fi

# Edit line in text editor with CTRL+E
autoload -Uz edit-command-line; zle -N edit-command-line
bindkey "^e" edit-command-line

# Preferred editor for local sessions
export EDITOR="micro"
export VISUAL="micro"

# Preferred editor for ssh sessions
if [[ -n "${SSH_CONNECTION}" ]]; then
    export EDITOR="nano"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "${HOME}/.p10k.zsh" ]] || source "${HOME}/.p10k.zsh"

alias biblia="$PREFIX/bin/biblia"

# ===============================
# = GIT
# ===============================
alias gs="git status"
alias gll="git log"
alias lsa="ls -lsa -it -r"

## Safer defaults and quality-of-life setopts (zsh)
setopt HIST_IGNORE_SPACE       # don't record commands starting with space
setopt HIST_VERIFY             # edit before running history-expanded command
setopt INC_APPEND_HISTORY_TIME # write to history incrementally with timestamps
setopt SHARE_HISTORY           # share history across sessions
setopt AUTO_CD                 # `foo` = `cd foo`
setopt NO_BEEP                 # disable bell
umask 077                      # secure default perms for new files/dirs

## Deduplicate PATH/MANPATH entries
typeset -U path PATH
typeset -U manpath MANPATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Optional: Lazy-load NVM/Node to speed login (kept your original lines above)
## Uncomment this block and comment the two lines above if you prefer lazy-load
# if [ -s "$NVM_DIR/nvm.sh" ]; then
#   nvm_lazy_load() {
#     \. "$NVM_DIR/nvm.sh"
#     unset -f node npm npx nvm
#     command "$@"
#   }
#   node() { nvm_lazy_load node "$@"; }
#   npm()  { nvm_lazy_load npm "$@"; }
#   npx()  { nvm_lazy_load npx "$@"; }
#   nvm()  { nvm_lazy_load nvm "$@"; }
# fi

# v1.0
# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
# v2.0
export PATH="$PREFIX/bin:$PREFIX/local/bin:$PATH"
# v3.0
# use the default termux path set on top of the file

## NOTE on LD_LIBRARY_PATH:
## Prepending non-Termux system paths can cause unpredictable behavior in Termux.
## If you need it for specific build tasks (e.g., xdebug), consider exporting only in that context.
export LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu:$LD_LIBRARY_PATH
# Safer alternative (commented):
# export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}/usr/lib/aarch64-linux-gnu"

# for PHP xDebug on Termux (aarch64), example output:
# ╰─❯ phpize
## Configuring for:
## PHP Version:             8.5
## PHP Api Version:         20250925
## Zend Module Api No:      20250925
## Zend Extension Api No:   420250925
## ❯ ./configure
## checking for grep that handles long lines and -e... /bin/grep
## checking for egrep... /bin/grep -E
## checking for a sed that does not truncate output... /bin/sed
## checking build system type... aarch64-unknown-linux-android
## checking host system type... aarch64-unknown-linux-android
## checking target system type... aarch64-unknown-linux-android
## checking for gawk... gawk
## checking for pkg-config... /data/data/com.termux/files/usr/bin/pkg-config
## checking pkg-config is at least version 0.9.0... yes
## checking for cc... cc
## checking whether the C compiler works... yes
## checking for C compiler default output file name... a.out
## checking for suffix of executables...
## checking whether we are cross compiling... no
## checking for suffix of object files... o
## checking whether the compiler supports GNU C... yes
## checking whether cc accepts -g... yes
## checking for cc option to enable C11 features... none needed
## checking how to run the C preprocessor... cc -E
## checking for egrep -e... (cached) /bin/grep -E
## checking for icc... no
## checking for suncc... no
## checking for system library directory... lib
## checking if compiler supports -Wl,-rpath,... yes
## checking for PHP prefix... /data/data/com.termux/files/usr
## checking for PHP includes... -I/data/data/com.termux/files/usr/include/php -I/data/data/com.termux/files/usr/include/php/main -I/data/data/com.termux/files/usr/include/php/TSRM -I/data/data/com.termux/files/usr/include/php/Zend -I/data/data/com.termux/files/usr/include/php/ext -I/data/data/com.termux/files/usr/include/php/ext/date/lib
## checking for PHP extension directory... /data/data/com.termux/files/usr/lib/php
## checking for PHP installed headers prefix... /data/data/com.termux/files/usr/include/php
## checking if debugging is enabled... no
## checking if PHP is built with thread safety (ZTS)... no

## Configuring extension
## checking whether to enable Xdebug support... yes, shared
## checking whether to enable Xdebug developer build flags... no
## checking whether to compress profiler files (requires zlib)... yes
## checking for supported PHP version... supported (8.5.1)
## checking for clock_gettime... yes
## checking for clock_gettime_nsec_np... no
## checking for gettimeofday... yes
## checking for stdio.h... yes
## checking for stdlib.h... yes
## checking for string.h... yes
## checking for inttypes.h... yes
## checking for stdint.h... yes
## checking for strings.h... yes
## checking for sys/stat.h... yes
## checking for sys/types.h... yes
## checking for unistd.h... yes
## checking for netinet/in.h... yes
## checking for poll.h... yes
## checking for sys/poll.h... yes
## checking for linux/rtnetlink.h... yes
## checking for res_ninit... no
## checking for __res_ninit... yes
## checking for res_nclose... no
## checking for __res_nclose... yes
## checking for cos in -lm... yes
## checking for zlib >= 1.2.9... yes

## Configuring libtool
## checking for a sed that does not truncate output... /bin/sed
## checking for ld used by cc... /data/data/com.termux/files/usr/bin/ld
## checking if the linker (/data/data/com.termux/files/usr/bin/ld) is GNU ld... yes
## checking for /data/data/com.termux/files/usr/bin/ld option to reload object files... -r
## checking for BSD-compatible nm... /data/data/com.termux/files/usr/bin/nm -B
## checking whether ln -s works... yes
## checking how to recognize dependent libraries... pass_all
## checking for dlfcn.h... yes
## checking the maximum length of command line arguments... 32768
## checking command to parse /data/data/com.termux/files/usr/bin/nm -B output from cc object... ok
## checking for objdir... .libs
## checking for ar... ar
## checking for ranlib... ranlib
## checking for strip... strip
## checking if cc supports -fno-rtti -fno-exceptions... yes
## checking for cc option to produce PIC... -fPIC
## checking if cc PIC flag -fPIC works... yes
## checking if cc static flag -static works... no
## checking if cc supports -c -o file.o... yes
## checking whether the cc linker (/data/data/com.termux/files/usr/bin/ld) supports shared libraries... yes
## checking whether -lc should be explicitly linked in... no
## checking dynamic linker characteristics... GNU/Linux ld.so
## checking how to hardcode library paths into programs... immediate
## checking whether stripping libraries is possible... yes
## checking if libtool supports shared libraries... yes
## checking whether to build shared libraries... yes
## checking whether to build static libraries... no

## creating libtool
## appending configuration tag "CXX" to libtool

## Generating files
## configure: creating build directories
## configure: creating Makefile
## configure: patching config.h.in
## configure: creating ./config.status
## config.status: creating config.h
## config.status: config.h is unchanged

# Force real Android getprop
## Only export if it exists to avoid surprises
if [ -x /system/bin/getprop ]; then
  export ANDROID_GETPROP=/system/bin/getprop
fi