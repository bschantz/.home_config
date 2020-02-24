#/bin/bash

# get location of this script
# see https://stackoverflow.com/a/246128/146477

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
# RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

echo "About to link profile configuration files from $DIR to $HOME. This will overwrite any existing files."
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
	for dotfile in .profile .bashrc .bash_logout .vimrc; do
		[[ -f "$HOME/$dotfile" ]] && rm "$HOME/$dotfile"
		ln -s "$DIR/$dotfile" "$HOME/$dotfile"
		echo $dotfile
	done
fi
