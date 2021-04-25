# Dotfiles

![](screenshot.png)

### This repo contains dotfiles for

- Terminal stuff (alacritty, wezterm, tmux)
- File manager (ranger, vifm, lf)
- Zsh (prompt, plugins, aliases and custom functions)
- i3{status,blocks}
- NeoVim (might work with Vim > 8)
- rofi
- sxhkd
- w3m
- Xresources

**Be aware that some configs require applications or scripts not in this repo -> adjust accordingly**

This repo works with the [RCM](https://github.com/thoughtbot/rcm) dotfiles manager.

### Zsh configuration includes but not limited to:

- beautiful, fast and informative prompt with Powershell10k
- a sane [fzf](https://github.com/junegunn/fzf) configuration also for shell autocompletion
- Fish like experience with [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- variuos exports based on available commands, e.g. awscli autocompletion
- history configuration
- key bindings
- some useful aliases and bash functions

### Neovim configuration includes but not limited to:

- Several useful plugins
- Mnemonic key configuration based upon `space` as leader key
- Git integration
- well structured vimrc

### This dotfile repo works best with my [Ansible](https://www.ansible.com/) roles:

- [Shell setup](https://repo.rootknecht.net/allaman/ansible-role-shell)
- [Package management](https://repo.rootknecht.net/allaman/ansible-role-packages)
- [Binaries](https://repo.rootknecht.net/allaman/ansible-role-binaries)
- [dotfiles](https://repo.rootknecht.net/allaman/ansible-role-dotfiles)

