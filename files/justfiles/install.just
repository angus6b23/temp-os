[group('install')]
install-lazyvim:
  #!/usr/bin/env sh
  @set -euxo pipefail
  if [ -d $HOME/.config/nvim ] 
  then 
    mv $HOME/.config/nvim{,.bak}
  fi
  if [ -d $HOME/.local/share/nvim ]
  then
    mv $HOME/.local/share/nvim{,.bak}
  fi
  if [ -d $HOME/.local/state/nvim ]
  then
    mv $HOME/.local/state/nvim{,.bak}
  fi
  if [ -d $HOME/.cache/nvim ]
  then
    mv $HOME/.cache/nvim{,.bak}
  fi
  git clone --depth 1 https://github.com/LazyVim/starter $HOEM/.config/nvim
  rm -rf $HOME/.config/nvim/.git

install-flatpaks:
  bluebuild-flatpak-manager install all
