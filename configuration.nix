{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.grub.device = "/dev/sda";
  networking.useDHCP = false; # deprecated
  networking.interfaces.enp0s3.useDHCP = true; # systemd Ethernet bus number 3
  services.xserver.enable = true;
  services.xserver.windowManager.xmonad.enable = true;
  environment.systemPackages = with pkgs; [
    git
  ];
  system.stateVersion = "21.05";
}
