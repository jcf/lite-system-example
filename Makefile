.DEFAULT_GOAL := check
.PHONY: check build

check:
	nix run nix-darwin -- --show-trace --flake "$(PWD)#darwin" check

build:
	nix run nix-darwin -- --show-trace --flake "$(PWD)#darwin" build
