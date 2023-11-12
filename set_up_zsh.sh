#!/bin/bash

# Update package list and install Zsh
echo "Installing Zsh..."
sudo apt-get update
sudo apt-get install -y zsh

# Set Zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zplug (a plugin manager for Zsh)
echo "Installing zplug..."
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME

# Add zplug to .zshrc
echo "source $ZPLUG_HOME/init.zsh" >> ~/.zshrc

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
zplug "zsh-users/zsh-autosuggestions"

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug install

# Source zplug and install plugins
zplug load" >> ~/.zshrc

# Reload Zsh configuration
echo "Reloading Zsh configuration..."
zsh -i -c 'source ~/.zshrc'

echo "Installation complete. Please restart your terminal."
