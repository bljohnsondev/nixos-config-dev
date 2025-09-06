{
  programs.zsh.completionInit = "zmodload zsh/complist";
  programs.zsh.initContent = ''
    zmodload zsh/complist

    zstyle ':completion:*' menu select
    zstyle ':completion:*' list-colors \'\'
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    zstyle ':completion:*' file-sort modification

    compdef -d mpv

    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
  '';
}
