{
  lib,
  pkgs,
  inputs,

  namespace, # The flake namespace, set in flake.nix. If not set, defaults to "internal".
  system, # The system architecture for this host (eg. `x86_64-linux`).
  target, # The Snowfall Lib target for this system (eg. `x86_64-iso`).
  format, # A normalized name for the system target (eg. `iso`).
  virtual, # A boolean to determine whether this system is a virtual target using nixos-generators.
  systems, # An attribute map of your defined hosts.

  config,
  specialArgs,
  ...
}:
with lib;
let
    cfg = config.${namespace}.services.sonarqube;
in
{
    options.${namespace}.services.sonarqube = {
        enable = mkEnableOption "Static Code Analysis tool!";

    };

    config = mkIf cfg.enable {
      age.secrets.sonarqube.file = ../../../../secrets/sonarqube.env.age;


      virtualisation.oci-containers.containers = {
        sonarqube-app = {
          image = "sonarqube:community";
          autoStart = true;
          dependsOn = [ "sonarqube-db" ];
          extraOptions = [ "--network=sonarqube" ];

          volumes =
              [
                  "/mnt/raid/services/sonarqube/data:/opt/sonarqube/data:rw"
                  "/mnt/raid/services/sonarqube/extensions:/opt/sonarqube/extensions:rw"
                  "/mnt/raid/services/sonarqube/logs:/opt/sonarqube/logs:rw"
              ];

          ports =
              [
                  "9000:9000" # WEB-UI
              ];

          environmentFiles = [
              config.age.secrets.sonarqube.path
          ];
        };

        sonarqube-db = {
          image = "postgres:12";
          autoStart = true;
          extraOptions = [ "--network=sonarqube" ];
          volumes =
              [
                  "/mnt/raid/services/sonarqube/db:/var/lib/postgresql:rw"
                  "/mnt/raid/services/sonarqube/db_data:/var/lib/postgresql/data:rw"
              ];

          environmentFiles = [
              config.age.secrets.sonarqube.path
          ];
        };
      };



      networking.firewall.allowedTCPPorts = [ 9000 ];
      services.nginx.virtualHosts."sonar.semiko.dev" = {
        forceSSL = true;
        useACMEHost = "semiko.dev";
        locations."/".proxyPass = "http://[::1]:9000";
        extraConfig = "proxy_ssl_server_name on;";
      };
    };
}
