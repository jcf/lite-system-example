{ config
, ...
}: {
  config = {
    home-manager = {
      users.${config.my.username} = { };
      sharedModules = [{
        # Must be present or it'll be used but not-defined.
        home.stateVersion = "23.11";

        # Pass our global configuration into the Home Manager context so things
        # like `username` are always available.
        my = config.my;
      }];
    };
  };
}
