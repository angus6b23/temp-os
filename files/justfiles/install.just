[group('install')]
install-lazyvim:
	#!/usr/bin/env sh
	@set -euxo pipefail
	if [ -d ~/.config/nvim ] 
	then 
	  mv ~/.config/nvim{,.bak}
	fi
	if [ -d ~/.local/share/nvim ]
	then
	  mv ~/.local/share/nvim{,.bak}
	fi
	if [ -d ~/.local/state/nvim ]
	then
	  mv ~/.local/state/nvim{,.bak}
	fi
	if [ -d ~/.cache/nvim ]
	then
	  mv ~/.cache/nvim{,.bak}
	fi
	git clone --depth 1 https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git

[group('install')]
install-flatpaks:
	bluebuild-flatpak-manager install all
