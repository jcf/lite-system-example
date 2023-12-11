.DEFAULT_GOAL := check
.PHONY: check build

check:
	nix run nix-darwin -- --flake "$(PWD)#darwin" check

build:
	nix run nix-darwin -- --flake "$(PWD)#darwin" build
