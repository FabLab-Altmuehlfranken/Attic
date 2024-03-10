{ config, pkgs, ... }:
{
  imports = [
    ./atticd.nix
    ./networking.nix
    ./hardware-configuration.nix
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

  services.openssh.enable = true;

  networking.firewall.enable = false;
  system.stateVersion = "23.05";
}

