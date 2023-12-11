{ config
, lib
, ...
}:
let
  inherit (lib) mkOption mkOptionType types;
in
{
  imports = [
    ./home-manager
    ./zsh
  ];

  options.my = {
    username = mkOption {
      type = types.str;
      default = "jcf";
    };

    system = mkOption {
      type = types.submodule { };
      default = { };
    };

    home = mkOption {
      type = mkOptionType {
        name = "my.home";
        inherit (types.submodule { }) check;
        merge = lib.options.mergeOneOption;
        description = "Home Manager configuration passed to home-manager";
      };
      default = { };
    };
  };

  config = {
    # Must be set in order to build a multi-user system.
    services.nix-daemon.enable = true;

    # Without this, we're told attribute '$USER' is missing.
    users.users.${config.my.username} = { };
  };
}
