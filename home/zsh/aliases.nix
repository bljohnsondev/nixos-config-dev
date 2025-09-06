{
  programs.zsh.shellAliases = {
    cls = "clear";
    ls = "eza --group";
    cat = "bat";
    vi = "vim";
    sshcolor = "TERM=xterm-256color ssh";
    cleandockerimages = "docker rmi $(docker images --filter \"dangling=true\" -q --no-trunc)";
    runsshagent = "eval \"$(ssh-agent -s)\"";
    ncdu = "ncdu --color dark";
    diskutil = "sudo ncdu --color dark --exclude=/mnt /";
  };
}
