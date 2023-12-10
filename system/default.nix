{ config
, lib
, ...
}:
let
  inherit (lib) mkOption types;
in
{
  imports = [
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
      type = types.submodule { };
      default = { };
    };
  };
}
