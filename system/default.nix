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
}
