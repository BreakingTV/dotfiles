{ lib, pkgs, config, ... }:
{
   home.username = "semiko";
   home.homeDirectory = "/home/semiko";

   imports = [
        # --- CORE --- #
        ../../modules/core/git

        # --- APPS --- #
        ../../modules/apps/spotify
        ../../modules/apps/vesktop
        ../../modules/apps/chromium

        ../../modules/apps/jetbrains/intellij
        ../../modules/apps/jetbrains/webstorm
        ../../modules/apps/virt-manager


        # -- CONFIG LOADER -- #
        ../../modules/apps/desktop/environment/gnome-config
    ];


   services.spotify.enable = true;

   services.intellij.enable = true;
   services.webstorm.enable = true;
   services.virt-manager.enable = true;

   services.chromium.enable = true;
   services.vesktop.enable = true;
   services.gnome-config.enable = true;

   services.git = {
        enable = true;
        email = "danil80sch@gmail.com";
   };


  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

}