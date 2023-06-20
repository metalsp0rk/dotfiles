#!/usr/bin/env bash

echo "WARNING: this script only supports macOS"


SIGNING_KEY=""
INCLUDE_GPGSIGN=false

setup_signingkey() {
  cat <<EOF > ~/.git.d/signing
[commit]
  gpgsign = true
[tag]
  gpgsign = true
[gpg]
  format = ssh
EOF
  INCLUDE_GPGSIGN=true
}

# configure git user settings
Full_Name=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/LongUserNameKey :/ && ! /loginwindow/ { print $3 " " $4 }')
Email=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/UserNameKey :/ && ! /LongUserNameKey/ { print $3 }')@planetart.com


while true; do
  read -p "Set up SSH signing key (y/n)" yn
  case $yn in
    [Yy]* ) setup_signingkey; break;;
    [Nn]* ) break;;
    * ) echo "Please answer y/n.";;
  esac
done


cat << EOF > ~/.git.d/userconfig
[user]
  name = $Full_Name
  email = $Email
EOF
if [ $INCLUDE_GPGSIGN ]; then
  cat << EOF >> ~/.git.d/userconfig
  signingkey = ~/.ssh/id_rsa.pub
EOF
fi

echo "Created git user config:"
cat ~/.git.d/userconfig | sed 's/^/    /'
if [ $INCLUDE_GPGSIGN ]; then
  echo "Created git signing config:"
  cat ~/.git.d/signing | sed 's/^/    /'
fi
