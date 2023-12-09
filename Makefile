.DEFAULT_GOAL := check
.PHONY: check build

check:
	nix run nix-darwin -- --flake $(PWD) check

build:
	nix run nix-darwin -- --flake $(PWD) build
