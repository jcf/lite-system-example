{ config
, osConfig
, lib
, ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = osConfig.my.home.git;
in
{
  options.my.home.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    programs.git.enable = true;
  };
}
