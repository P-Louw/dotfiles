# Powerline-shell setup

Shell only powerline variant.

## Requires
- Powerline-font
- [Powerline-shell](https://github.com/b-ryan/powerline-shell)

## Setup
Install using pip or from github
*Github*
```
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
python setup.py install
```
*Pip*
```
pip install powerline-shell
```

Add the following to bashrc or source .userconf.sh from bashrc
```
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
```

Place folder powerline-shell in ~/.config

