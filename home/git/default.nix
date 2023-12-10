{ config
, lib
, ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.my.home.git;
in
{
  options.my.home.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    programs.git.enable = true;
  };
}
