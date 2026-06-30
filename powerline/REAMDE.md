# Powerline personal setup

## Requires

- [Powerline](https://github.com/powerline/powerline)
- Powerline fonts
- [Powerline-gitstatus](https://github.com/jaspernbrouwer/powerline-gitstatus)

## Install

### Powerline

Powerline itself might be available from distro repo

```
# Fedora
sudo dnf install powerline powerline-fonts
```

### Git-Status

For git status a separate segment is used.
Install using pip

```
pip install powerline-gitstatus

```

### Add to bashrc for powerline

```
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
```
