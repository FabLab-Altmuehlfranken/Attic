{
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    attic = { url = "github:zhaofengli/attic"; };
  };

  outputs = { self, nixpkgs, attic }: {
    nixosConfigurations.attic = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, ... }: {
          nix = {
            package = pkgs.nixFlakes;
            extraOptions = ''
              experimental-features = nix-command flakes
            '';
            registry.nixpkgs.flake = nixpkgs;
          };
          environment.systemPackages = [
            attic.packages.x86_64-linux.attic-client
          ];


          imports = [
            ./configuration.nix
            attic.nixosModules.atticd
          ];
        })
      ];
    };
  };
}
