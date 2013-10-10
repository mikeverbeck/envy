#!/usr/bin/env bash

# install env at /usr/local/bin and place files in ~/.envy

if [[ ! -d "${HOME}/.envy" ]]; then
  mkdir "${HOME}/.envy"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -fR "${DIR}/../" "${HOME}/.envy" 

cp "${DIR}/envy" "/usr/local/bin/"
