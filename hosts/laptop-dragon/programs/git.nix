{ ... }:

{
  programs.git = {
    enable = true;
    config.core.editor = "nvim";
    config = {
      init.defaultBranch = "main";
    };
  };
}
