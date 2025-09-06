unameout="$(uname -s)"

case "${unameout}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameout}" ;;
esac

if [ "${machine}" == "Linux" ]; then
  yay -S --needed --noconfirm github-cli nodejs npm
fi
