{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.services.homepage;
in
{
    options.services.homepage = {
        enable = mkEnableOption "custom homepage service";
    };

    config = mkIf cfg.enable {

         environment = {
             HOMEPAGE_CONFIG_DIR = "/mnt/raid/services/homepage/";
         };

        services.homepage-dashboard = {
            enable = true;
            listenPort = 3000;

            settings = {
                title = ''Semiko'';
                headerStyle = ''clean'';
                target = ''_blank'';

                color = ''gray'';
                background = {
                    image = ''https://images.unsplash.com/photo-1689351060804-fca36e095da4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80'';
                    blur = ''sm'';
                };
            };

            widgets = {
                search = {
                    provider = [''google'' ''duckduckgo''];
                    focus = true;
                    target = ''_blank'';
                };

                resources = {
                    label = ''Disks'';
                    /*  TODO: ADD DISKS SOMEHOW */
                };

                datetime = {
                    text_size = ''x1'';

                    format = {
                        dateStyle = ''short'';
                        timeStyle = ''short'';
                        hourCycle = ''h23'';
                    };
                };

                services = [
                    {
                        "Remote" = [{
                            "Nextcloud" = {
                                href = ''https://cloud.semiko.dev'';
                                icon = ''nextcloud'';
                                description = ''Self-Hosted Cloud Platform'';
                            };

                            "Firefly 3" = {
                                href = ''https://cash.semiko.dev'';
                                icon = ''firefly'';
                                description = ''Finance managment software'';
                            };

                            "Vaultwarden" = {
                                href = ''https://vault.semiko.dev'';
                                icon = ''vaultwarden'';
                                description = ''Password Manager Service'';
                            };

                        }];

                        "Local (only with VPN)" = [{
                            "Fritz!Box" = {
                                href = ''http://192.168.1.1'';
                                icon = ''avmfritzbox'';
                                description = ''Router configuration interface'';
                            };
                        }];
                    }
                ];

            };
        };

        services.nginx.virtualHosts."semiko.dev" = {
            addSSL = true;
            enableACME = true;
            serverAliases = [ "www.semiko.dev" ];
            locations."/".proxyPass = "http://127.0.0.1:3000";
            extraConfig =
              # required when the target is also TLS server with multiple hosts
              "proxy_ssl_server_name on;" +
              # required when the server wants to use HTTP Authentication
              "proxy_pass_header Authorization;"
              ;
        };
    };
}