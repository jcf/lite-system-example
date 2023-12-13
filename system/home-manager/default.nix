{ config
, ...
}: {
  config = {
    home-manager = {
      users.${config.my.username} = { };
      sharedModules = [{
        # Must be present or it'll be used but not-defined.
        home.stateVersion = "23.11";
      }];
    };
  };
}
