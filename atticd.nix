{
  services.atticd = {
    enable = true;

    # Placed manually for now
    # Consider management with sops-nix
    credentialsFile = "/etc/atticd.env";

    settings = {
      listen = "0.0.0.0:8080";

      chunking = {
        nar-size-threshold = 64 * 1024; # 64 KiB
        min-size = 16 * 1024; # 16 KiB
        avg-size = 64 * 1024; # 64 KiB
        max-size = 256 * 1024; # 256 KiB
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 8080 ];
  };
}
