{ config, pkgs, ... }:

#######################
# IT IS NOT WORKING YET
#######################

let
  secretsDir = "${config.home.homeDirectory}/.secrets";
in
{
  home.sessionVariables = {
    ANTHROPIC_API_KEY      = "$(cat ${secretsDir}/gemini-api-key)";
    ANTHROPIC_BASE_URL      = "https://generativelanguage.googleapis.com/v1beta/openai/";
    ANTHROPIC_MODEL         = "gemini-2.5-flash";
    ANTHROPIC_AUTH_TOKEN    = "dummy";

    #ANTHROPIC_DEFAULT_HAIKU_MODEL  = "openai/o4-mini";
    #ANTHROPIC_DEFAULT_SONNET_MODEL = "qwen/qwen3-coder:free";
    #ANTHROPIC_DEFAULT_OPUS_MODEL   = "qwen/qwen3-coder:free";
  };
  programs.bash = {
    enable = true;
    sessionVariables = {
      ANTHROPIC_API_KEY = "$(cat ${config.home.homeDirectory}/.secrets/gemini-api-key)";
    };
  };

  #home.packages = [ pkgs.nodejs ];

  programs.claude-code = {
    enable = true;
    /*settings = {
      theme = "dark";

      /*env = {
        ANTHROPIC_BASE_URL = "https://openrouter.ai/api/v1";                #"https://generativelanguage.googleapis.com/v1beta/openai/";
	      ANTHROPIC_AUTH_TOKEN = "$OPENROUTER_API_KEY";
        ANTHROPIC_MODEL = "qwen/qwen3-coder:free";                       #"gemini-2.5-flash";
        #ANTHROPIC_API_KEY = "dummy";

        ANTHROPIC_DEFAULT_HAIKU_MODEL  = "openai/o4-mini";    # fast/cheap tasks
        ANTHROPIC_DEFAULT_SONNET_MODEL = "qwen/qwen3-coder:free";  # main coding
        ANTHROPIC_DEFAULT_OPUS_MODEL   = "qwen/qwen3-coder:free";  # heavy reasoning
      };*/
    };*/
  };
}
