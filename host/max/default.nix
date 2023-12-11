{ config
, ...
}:
let
  my = config.my;
in
{
  my = {
    system = {
      zsh.enable = true;
    };

    home = {
      git.enable = true;
    };
  };
}
