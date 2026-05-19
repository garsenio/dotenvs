PHONY: push pull

push:
	cp ~/.config/helix/config.toml .
	cp ~/.config/helix/languages.toml .
	cp ~/.zshrc .

pull:
	cp config.toml ~/.config/helix/config.toml
	cp languages.toml ~/.config/helix/languages.toml
	cp .zshrc ~/
