#!/usr/bin/env bash

setup_signingkey() {
  echo "Signing Key autoconfig Not yet implemented"
  # $SIGNING_KEY=$(gpg --list-keys | grep -B1 $Email | head -n1 | awk '{print $1}')
  # echo $SIGNING_KEY
}

# configure git user settings
Full_Name=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/LongUserNameKey :/ && ! /loginwindow/ { print $3 " " $4 }')
Email=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/UserNameKey :/ && ! /LongUserNameKey/ { print $3 }')


while true; do
  read -p "Set up GPG signing key (y/n)" yn
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
