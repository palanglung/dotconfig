set -e

_select_app() {
  APP=$(gum choose "Alacritty" "WezTerm" "Ghostty" --header "Install Terminal App:")
  case "$APP" in
  Alacritty)
    install=alacritty
    ;;
  WezTerm)
    install=wezterm
    ;;
  Ghostty)
    install=ghostty
    ;;
  *)
    gum confirm "Choose Terminal App?" && _select_app
    ;;
  esac
}
_select_app

_install $APP $install
_configure $install
