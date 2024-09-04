{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.services.podman;
in
{
    options.services.podman = {
        enable = mkEnableOption "custom podman service";
    };

    config = mkIf cfg.enable {
        virtualisation.containers.enable = true;

         virtualisation.podman = {
            enable = true;
            dockerCompat = true;
        };

         # Useful other development tools
         environment.systemPackages = with pkgs; [
            dive # look into docker image layers
            podman-tui # status of containers in the terminal
            #docker-compose # start group of containers for dev
            podman-compose # start group of containers for dev
         ];
    };
}
