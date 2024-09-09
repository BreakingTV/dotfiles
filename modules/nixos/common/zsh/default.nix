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
    cfg = config.${namespace}.common.zsh;
in
{
    options.${namespace}.common.zsh = {
        enable = mkEnableOption "Setup zsh!";
    };

    config = mkIf cfg.enable {
      users.defaultUserShell = pkgs.zsh;
      environment.shells = [ pkgs.zsh ];

      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        ohMyZsh = {
          enable = true;
          plugins = [ "git" ];
          theme = "agnoster";
        };
      };
    };
}