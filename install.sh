#!/bin/bash
set -e

_current_os() {
  case "$(uname -s)" in
  Darwin)
    os=darwin
    gui=true
    ;;
  *)
    echo "OS Not Supported"
    exit 1
    ;;
  esac
}
_current_os

echo "Install Required Tooling..."
source install/pre.${os}.sh

# Function to install a specific app
install_app() {
  local app_file="$1"

  case "$(basename $app_file)" in
  terminal.sh)
    if $gui; then
      source $app_file
    fi
    ;;
  *)
    source $app_file
    os_app_name="app_name_$os"
    app_name=${!os_app_name}
    if [[ ! -z $app_name ]]; then
      _install "$title" $app_name
    fi

    [[ ! -z $config_name ]] && _configure $config_name
    ;;
  esac
}

# If specific apps are provided as arguments, install only those
if [ $# -gt 0 ]; then
  echo "Installing selected apps: $@"
  for app in "$@"; do
    app_file="install/app/${app}.sh"
    if [ -f "$app_file" ]; then
      echo "Installing $app..."
      install_app "$app_file"
    else
      echo "Warning: App '$app' not found in install/app directory"
    fi
  done
else
  # Otherwise install all apps
  echo "Installing all apps..."
  for file in install/app/*; do
    install_app "$file"
  done
fi
