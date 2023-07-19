{ config, pkgs,  ... }:
{
  imports = [ ./hardware-configuration.nix ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.xserver.enable = true;
  services.xserver.windowManager.xmonad.enable = true;
  environment.systemPackages = with pkgs; [
    git
    (wrapFirefox firefox-esr-unwrapped {
      nixExtensions = [
        (fetchFirefoxAddon {
          name = "ublock";
          url = "https://addons.mozilla.org/firefox/downloads/file/4121906/ublock_origin-1.50.0.xpi";
          sha256 = "10618003e70b528c3f17996e373146d39e6b15f777ac4ca1f214da2ffdb7a5b3";
        })
      ];
    })
  ];
  system.stateVersion = "23.05";
}
