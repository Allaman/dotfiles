# Dotfiles

![](screenshot.png)

### This repo contains dotfiles for

- zsh (zshrc, zshenv, profile, aliases, funcs)
- [Powershell10k](https://github.com/romkatv/powerlevel10k)
- tmux
- NeoVim (might work with Vim > 8)
- ranger
- vifm
- i3{status,blocks}
- rofi

**Be aware that some configs require applications or scripts not in this repo -> adjust accordingly**

This repo works with the [RCM](https://github.com/thoughtbot/rcm) dotfiles manager.

### Zsh configuration includes but not limited to:

- Fish like experience with [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- variuos exports based on available commands, e.g. awscli autocompletion
- history configuration
- key bindings
- beautiful, fast and informative prompt with Powershell10k
- some useful aliases and bash functions
- a sane [fzf](https://github.com/junegunn/fzf) configuration also for shell autocompletion

### Neovim configuration includes but not limited to:

- Several useful plugins, e.g. [NERDTree](https://github.com/preservim/nerdtree), [fzf-vim](https://github.com/junegunn/fzf.vim), [undotree](https://github.com/mbbill/undotree), [UltiSnips](https://github.com/SirVer/ultisnips), and more
- Mnemonic key configuration based upon `space` as leader key
- Git integration
- well structured vimrc

### This dotfile repo works best with my [Ansible](https://www.ansible.com/) roles:

- [Shell setup](https://repo.rootknecht.net/allaman/ansible-role-shell)
- [Package management](https://repo.rootknecht.net/allaman/ansible-role-packages)
- [Binaries](https://repo.rootknecht.net/allaman/ansible-role-binaries)
- [dotfiles](https://repo.rootknecht.net/allaman/ansible-role-dotfiles)

