#!/usr/bin/env bash

# install env at /usr/local/bin and place files in ~/.envy

if [[ ! -d "${HOME}/.envy" ]]; then
  mkdir "${HOME}/.envy"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -fR "${DIR}/../" "${HOME}/.envy" 

cp "${DIR}/envy" "/usr/local/bin/"

# copy all .dotfiles to system asset
if [[ ! -d "${HOME}/.envy/assets/System" ]]; then
  mkdir "${HOME}/.envy/assets/System"
fi

dotfiles=($(find ~/ -maxdepth 1 -regex ".*/\..*" 2>/dev/null))
for file_path in "${dotfiles[@]}"
do
  if [[ "$file_path" =~ .*Trash|.*envy|.*ievms|.*codeintel|.*gem|.*rvm ]]; then
    echo "Skipping $file_path"
  else
    echo "backing up $file_path"
    #cp is way slow... maybe want to do tar
    cp -R "$file_path" ~/.envy/assets/System
  fi
done
