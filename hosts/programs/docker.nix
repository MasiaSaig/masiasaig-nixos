{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker-buildx
  ];
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = false;
}
