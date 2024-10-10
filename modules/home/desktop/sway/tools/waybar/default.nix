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
    cfg = config.${namespace}.desktop.config.sway.tools.waybar;
in
{
    options.${namespace}.desktop.config.sway.tools.waybar = {
        enable = mkEnableOption "Setup Waybar!";
    };

    config = mkIf cfg.enable {
      home.packages = with pkgs; [
          waybar-mpris
      ];

      /* Import Files */

      /* Default Style */
      home.file.".config/waybar/rose-pine.css".source = ./style/rose-pine.css;
      home.file.".config/waybar/index.css".source = ./style/index.css;



      programs.waybar = {
        enable = true;
        systemd.enable = true;

        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            height = 26;

            modules-left = [ "sway/workspaces" "sway/window" ];
            modules-right = [  "pulseaudio" "network" "disk" "battery" "clock" ];

            "sway/workspaces" = {
              disable-scroll = true;
              all-outputs = true;
              disable-click = true;

              format = "{name} {icon}";

              format-icons = {
                "1" = "🔥";
                "2" = "✨";
                "3" = "🎉";
                "4" = "🎸";
                "5" = "🧋";
                "6" = "🐈‍⬛";
                "7" = "🎯";
                "8" = "🎇";
                "9" = "〽️";
                "10" = "✴️";
              };
            };

            "sway/window" = { 
              all-outputs = true;
              "format" = "| {title}";
              "icon" = false;
              "icon-size" = 18;
              "max-length" = 30;
            };

            "clock" = {
              interval = 60;

              timezone = "Europe/Berlin";
              locale = "de_DE.UTF-8";
              format = " {:%H:%M}";
            };

            "pulseaudio" = {
                format = "{icon} {volume}%";
                format-bluetooth = "󰂰 {icon} {volume}%";
                format-source-muted = " ";
                format-icons = [ "" ];
            };

            "network" = {
              interval = 3;
              format-wifi = "{icon} {essid} {signalStrength}%";
              format-disconnected = "{icon} ";
              format-ethernet = "󰌗 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
              format-icons = [ "" ];
            };

            "battery" = {
              interval = 10;
              tooltip = false;
              states = {
                "full" = 100;
                "warning" = 30;
                "critical" = 10;
              };

              format = "{icon} {capacity}% // {time}";
              format-icons = [ "🍎⚠️" "🌻" "🍃" ];
            };

            "disk" = {
              interval = 10;
              format = "󰆼 {percentage_free}% free";
              path = "/";
            };

          };
        };

        style = ''
          @import "./rose-pine.css";
          @import "./index.css";
        '';

      };
    };
}