{ config
, ...
}: {
  config = {
    home-manager = {
      users.${config.my.username} = { };
      sharedModules = [{ my = config.my; }];
    };
  };
}
