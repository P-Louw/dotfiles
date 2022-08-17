# Additional bashrc settings, source from bashrc.

# Needed for jenins linter api
#JENKINS_USER_ID=
#JENKINS_API_TOKEN=
#JENKINS_PASSWORD=
#JENKINS_URL=

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

# Langage server 3rd party dependencies.
# https://github.com/zigtools/zls#installation
PATH="$PATH:$HOME/zls/"
# https://github.com/GroovyLanguageServer/groovy-language-server#build
PATH="$PATH:/opt/groovy-language-server.jar"
# https://github.com/b-ryan/powerline-shell
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

source ~/lscolors.sh

export PATH
