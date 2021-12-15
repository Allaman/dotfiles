.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help

PUBLIC:=$$HOME/workspace/github.com/allaman/public-dotfiles/
PRIVATE:=$$HOME/workspace/git.rootknecht.net/private-dotfiles/
ALL_EXCLUDE:="-x README -x LICENSE -x screenshot.png"
MAC_EXCLUDE:="-x i3 -x config/i3blocks -x config/i3status -x config/zathura -x config/sxhkd -x config/rofi -x Xresoources"
LINUX_EXCLUDE:=""

mac: ## configuring dotfiles for mac
	echo rcup -d $(PUBLIC) $(ALL_EXCLUDE) $(MAC_EXCLUDE)

linux: ## configuring dotfiles for linux
	echo rcup -d $(PUBLIC) $(ALL_EXCLUDE) $(LINUX_EXCLUDE)

