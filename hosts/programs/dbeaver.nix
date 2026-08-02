{ pkgs, ... }:

# If dumping/restoring does not work, change "local client" to point to mysqldump
# https://dbeaver.com/docs/dbeaver/Local-Client-Configuration/#configure-a-local-client-in-dbeaver-on-mac-and-linux
# >> find / -name "mysqldump" 2>/dev/null
# path: "/nix/store/..."

{
  environment.systemPackages = with pkgs; [
    dbeaver-bin
    mariadb
  ];
}
