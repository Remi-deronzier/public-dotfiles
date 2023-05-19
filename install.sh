#!/bin/zsh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Define a function which rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
backup() {
    target=$1
    if [ -e "$target" ]; then
        if [ ! -L "$target" ]; then
            mv "$target" "$target.backup"
            echo "-----> Moved your old $target config file to $target.backup"
        fi
    fi
}

symlink() {
    file=$1
    link=$2
    if [ ! -e "$link" ]; then
        echo "-----> Symlinking your new $link"
        ln -s $file $link
    fi
}

# For all files `$name` in the present folder except `*.zsh`,
# backup the target file located at `~/.$name` and symlink `$name` to `~/.$name`
for name in gitconfig gitconfig-work-bam hyper.js zshrc zprofile mackup.cfg; do
    if [ ! -d "$name" ]; then
        target="$HOME/.$name"
        backup $target
        symlink $PWD/$name $target
    fi
done

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set macOS preferences - we will run this last because this will reload the shell
source ./macos

# Refresh the current terminal with the newly installed configuration
exec zsh

echo "👌 Everything done!"
