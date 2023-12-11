.DEFAULT_GOAL := check
.PHONY: check build

check:
	nix run nix-darwin -- --show-trace --flake "$(PWD)#aarch64-darwin" check

build:
	nix run nix-darwin -- --show-trace --flake "$(PWD)#aarch64-darwin" build
