{ config
, ...
}: {
  config = {
    home-manager = {
      users.${config.my.username} = { };
      sharedModules = [{
        # Must be present or it'll be used but not-defined.
        home.stateVersion = "23.11";

        # Passing all of `my` does not work. Passing `my.home` and `my.username`
        # also blows up. We can pass just `my.home` but that won't be enough to
        # configure an entire system.
        my.home = config.my.home;
      }];
    };
  };
}
