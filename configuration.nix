{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.xserver.enable = true;
  services.xserver.windowManager.xmonad.enable = true;
  environment.systemPackages = with pkgs; [
    git
  ];
  system.stateVersion = "23.05";
}
