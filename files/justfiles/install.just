alias lazyvim := install-lazyvim
alias flatpak := install-flatpaks
alias brew := install-brew
alias waydroid := install-waydroid
alias omz := install-omz
alias corepack := install-corepack

# install lazyvim
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

# install waydroid
[group('install')]
install-waydroid:
    sudo rpm-ostree install waydroid
    sudo rpm-ostree ex apply-live

# trigger default-flatpak installs
[group('install')]
install-flatpaks:
    bluebuild-flatpak-manager apply all

# Install Homebrew | https://brew.sh
[group('install')]
install-brew:
    #!/usr/bin/env bash
    source /usr/lib/ujust/ujust.sh
    if [[ ! -f "/var/home/linuxbrew/.linuxbrew/bin" || ! -x "/var/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
        echo "${b}Brew Installation${n}"
        echo "Please ${b}IGNORE${n} everything the installer tells you to do at the end"
        echo "We have already done it for you! You just need to close and re-open the terminal after installation"
        echo "Do you understand?"
        echo "Please type in \"YES I UNDERSTAND\" and press enter"
        read ACCEPT
        if [ "$ACCEPT" == "YES I UNDERSTAND" ]; then
          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
          echo "Capitalization matters when you type \"YES I UNDERSTAND\""
        fi
    fi

# install oh-my-zsh
[group('install')]
install-omz:
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install corepack for npm
[group('install')]
install-corepack:
    npm install -g corepack
