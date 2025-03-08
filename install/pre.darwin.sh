set -e

source install/pre.common.sh

_install() {
  gum spin --spinner meter --title "Installing $1" --show-output -- bash -c "brew install $2"
}

if ! _is_cmd_installed brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! _is_cmd_installed gum; then
  brew install gum >/dev/null
fi

if ! _is_cmd_installed git; then
  _install "Git" git
fi

if ! _is_cmd_installed stow; then
  _install GNU/Stow stow
  _configure stow
fi

if _is_cmd_installed gum; then
  gum spin --spinner meter --title "Updating submodule" --show-output -- bash -c "git submodule update --init"
fi
