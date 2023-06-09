{...}: {
  programs.zsh = {
    initExtra = ''
      setopt PROMPT_SUBST
      autoload -Uz vcs_info
      precmd_functions+=( vcs_info )

      zstyle ':vcs_info:*' enable git # only enable git
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' formats '(%F{green}%c%u%b%f)'
      zstyle ':vcs_info:git:*' actionformats '(%F{green}%b%f|%F{9}%a%f)'
      zstyle ':vcs_info:git:*' stagedstr '%F{11}'
      zstyle ':vcs_info:git:*' unstagedstr '%F{red}'

      NEWLINE=$'\n'
      PROMPT='%F{11}%n@%m%b%F{12} %(!.%1~.%~)%f ''${vcs_info_msg_0_}''${NEWLINE}%(?.%F{white}.%F{red})%(!.#.$)%f '
    '';
  };
}
