#!/usr/bin/env zsh

_bsd_="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${_bsd_}" != "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
    ln -sfn "${_bsd_}" "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sfn "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cat <<_ZSH_INIT_EOF_

Zsh initialiation setup done.
Please add customization by changing
  ${ZDOTDIR:-$HOME}/.zshrc.valkyrie
and submit a DIFF (pull/merge request) to
  $(git remote -v get-url origin)

_ZSH_INIT_EOF_
