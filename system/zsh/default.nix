{ config
, lib
, ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.my.system.zsh;
in
{
  options.my.system.zsh = {
    enable = mkEnableOption "zsh";
  };

  config = mkIf cfg.enable {
    programs.zsh.enable = true;
  };
}
