source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Load the theme.
#zplug "yous/lime"
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
# syntax-highlighting Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
 zplug "b4b4r07/enhancd", at:v1

 zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
 zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    use:get_last_pane_path.sh

# Support bitbucket
 zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# Rename a command with the string captured with `use` tag
 zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
 zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq

zplug "b4b4r07/emoji-cli", on:"stedolan/jq"

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
# zplug 'dracula/zsh', as:theme

# suggests commands as you type, based on command history.
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

export XDG_CONFIG_HOME="$HOME/.config"

alias vi='/usr/local/bin/nvim'
alias ll='/bin/ls -l'

export M3_HOME=/usr/local/apache-maven-3.3.9
export PATH="${M3_HOME}/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="$HOME/.rbenv/bin:${PATH}"
export PATH="$HOME/.goenv/bin:${PATH}"
export GOPATH=$HOME/go
export GOENV_ROOT="$HOME/.goenv"
export PATH=$PATH:$GOPATH/bin
export EDITOR=vi

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
if which goenv > /dev/null; then eval "$(goenv init - zsh)"; fi
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi
