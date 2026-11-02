{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -A";
      update = "sudo nixos-rebuild switch --flake .#nixos";
      upgrade = "sudo nixos-rebuild switch --flake .#nixos --upgrade";
    };
    
    initExtra = ''
      #parse_git_branch() {
      #  git branch 2>/dev/null | grep '*' | sed 's/* //'
      #}
      #export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;33m\] \$(parse_git_branch)\[\033[00m\]\$ "

      eval "$(starship init bash)"
    '';
  };
}
