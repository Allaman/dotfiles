# OBSOLET in FAVOR OF https://github.com/Allaman/dots

# Dotfiles

## Content

This repo contains my public dotfiles. This includes configuration and scripts. The config should be suitable for Linux and Mac machines.

⚠️ This repo is not intended to being cloned/used as it is from you. It is intended as an inspiration for others or for copying certain snippets.

![](./dotfiles.PNG)

**Be aware that some configs require applications or scripts not in this repo -> adjust accordingly**

![](screenshot.png)

## Features

Heavily focused on a terminal based and keyboard centric workflow ⌨️

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt with a lot of useful information right at your fingertips ⚙️
- Terminal wizardry with a mature [Tmux](https://github.com/tmux/tmux/wiki) configuration 🪄
- Fast GPU accelerated terminal emulators with [kitty](https://sw.kovidgoyal.net/kitty/), [Alacritty](https://github.com/alacritty/alacritty), and [wezterm](https://github.com/wez/wezterm) 🖥️
- [Lf](https://github.com/gokcehan/lf) for raw performance file managing and integrated bash scripting configuration. Backups in this repo: [nnn](https://github.com/jarun/nnn), [vifm](https://vifm.info/), and [ranger](https://github.com/ranger/ranger) 📁
- Manage your git repos with [gitui](https://github.com/extrawurst/gitui) and [tig](https://github.com/jonas/tig) 🔖
- An impressive zsh configuration with plenty of mappings, shortcuts, and settings to improve your productivity 🐚
- and more

## NeoVim

My NeoVim config is in [its own repo](https://github.com/Allaman/nvim/)

## Automatic configuration

I use [Ansible](https://www.ansible.com/) for automatic configuration of my devices and particularly [RCM](https://github.com/thoughtbot/rcm) for managing my dotfiles.

- [rice](https://github.com/Allaman/rice) for my Arch Linux based configuration
- [mac-setup](https://github.com/Allaman/mac-setup) for my Mac based configuration

## NOTE

Karabiner does not work this way, see https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/#about-symbolic-link

```sh
ln -s $HOME/workspace/github.com/allaman/public-dotfiles/config/karabiner $HOME/.config
```
