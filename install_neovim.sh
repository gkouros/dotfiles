#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y \
    neovim \
    python3-pynvim \
    git \
    curl \
    ripgrep \
    fd-find \
    universal-ctags \
    wl-clipboard

mkdir -p "$HOME/.config/nvim"

ln -sfn "$(realpath init.vim)" \
    "$HOME/.config/nvim/init.vim"

# Install vim-plug
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins non-interactively
nvim --headless +PlugInstall +qa

# Verify setup
nvim --headless "+checkhealth" +qa || true

