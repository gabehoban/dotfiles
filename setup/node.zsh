#!/usr/bin/env zsh
echo "\nš Starting Node Setup\n"


if type node > /dev/null 2>&1 ; then
  echo "š Node exists, skip install"
  node -v
else
  echo "š Node doesn't exist, continuing with install"
  n lts
  node -v 
  echo "š¦ n installed"
fi

npm i -g typescript
npm i -g firebase-tools
npm i -g yarn

echo "š¦ npm installed"
npm list -g --depth=0
