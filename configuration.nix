{ config, pkgs, ... }:
{
  imports = [
    ./atticd.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./ssh.nix
    ./users.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  networking = {
    hostName = "attic";
    domain = "fablab-altmuehlfranken.de";
  };

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = "23.05";
}

