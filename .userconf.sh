# Additional bashrc settings, source from bashrc.

# Needed for jenins linter api
#JENKINS_USER_ID=
#JENKINS_API_TOKEN=
#JENKINS_PASSWORD=
#JENKINS_URL=

# Langage server 3rd party dependencies.
# https://github.com/zigtools/zls#installation
PATH="$PATH:$HOME/zls/"

# Be sure to set JAVA_HOME for this.
# https://github.com/GroovyLanguageServer/groovy-language-server#build
PATH="$PATH:/opt/groovy-language-server.jar"


source ~/lscolors.sh

# Uncomment one of bottom 2 for shell line:
#
# Uncomment for powerline-shell
#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
#
# Or uncomment for powerline
#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi
export PATH
