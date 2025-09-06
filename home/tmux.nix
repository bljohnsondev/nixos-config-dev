{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_text "#W"
        '';
      }
    ];

    extraConfig = ''
# mouse support
set -g mouse on

# True color settings
set -g default-terminal "$TERM"

# Enable RGB (truecolor)
set -a terminal-features '*:RGB'

# Enable colored underlines (e.g. in Vim)
set -a terminal-features '*:usstyle'
set -ga terminal-overrides ",$TERM:Tc"
set -ga terminal-overrides ",alacritty:RGB"
set -ga terminal-overrides ",*256col*:Tc"
# fix the cursor shape https://github.com/neovim/neovim/issues/5096#issuecomment-469027417
set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
# undercurl support
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
# underscore colours - needs tmux-3.0
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

# Use extended keys (CSI u)
set -g extended-keys on

# start windows and panes at 1
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

# change the prefix
set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

# bindings to navigate windows
bind -n M-H previous-window
bind -n M-L next-window

# ensure new panes start in the cwd of the pane split from
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# dont rename the window
set-window-option -g automatic-rename off
set-option -g allow-rename off
    '';
  };
}
