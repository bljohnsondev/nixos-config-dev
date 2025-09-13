{ config, pkgs, ... }:

{
  # Set the state version
  home.stateVersion = "25.05";

  imports = [
    ./tmux.nix
    ./zsh/aliases.nix
    ./zsh/completion.nix
    ./zsh/searchfix.nix
  ];

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  # Add packages and configuration here
  home.packages = [
    pkgs.bat
    pkgs.bottom
    # pkgs.btop # without gpu
    pkgs.btop-cuda # nvidia
    pkgs.devpod
    pkgs.devpod-desktop
    pkgs.distrobox
    pkgs.eza
    pkgs.fd
    pkgs.firefox-devedition
    #pkgs.ghostty - ghostty is super slow on older machines
    pkgs.git
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.joplin-desktop
    pkgs.lazygit
    pkgs.mariadb
    pkgs.ncdu
    pkgs.nerd-fonts.fira-code
    pkgs.oh-my-zsh
    pkgs.ripgrep
    pkgs.tmux
    pkgs.ungoogled-chromium
    pkgs.vim
    pkgs.vscode
    pkgs.xclip
  ];

  /*
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 12;
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
      copy_on_select = true;
      tab_bar_style = "slant";
      tab_title_template = "{index}:{title[:10]}";
    };
  };
  */

  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [ "~/.config/alacritty/themes/catppuccin-mocha.toml" ];
      selection.save_to_clipboard = true;
      font.size = 12;
      font.bold.family = "FiraCode Nerd Font";
      font.bold.style = "Bold";
      font.bold_italic.family = "FiraCode Nerd Font";
      font.bold_italic.style = "Bold Italic";
      font.italic.family = "FiraCode Nerd Font";
      font.italic.style = "Italic";
      font.normal.family = "FiraCode Nerd Font";
      font.normal.style = "Regular";
      window.startup_mode = "Maximized";
      window.dimensions.columns = 120;
      window.dimensions.lines = 50;
    };
  };

  /*
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "tokyonight";
      font-family = "FiraCode Nerd Font";
      font-size = "14";
      copy-on-select = "true";
      maximize = "true";
      window-width = "9999";
      window-height = "9999";
    };
  };
  */

  # this tells home-manager not to manage my .zshrc file since it comes from dotfiles
  # home.file.".zshrc".source = /home/brent/.zshrc;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" "ssh-agent" ];
      theme = "steeef";
    };
  };

  # for export variables like EDITOR, etc
  # home.sessionVariables = {};

  home.sessionPath = [
    "$HOME/bin"
    "/usr/local/bin"
  ];

  dconf.enable = true;

  dconf.settings = {
    "org/gnome/shell" = {
      # This is how you enable the extension
      # Make sure to include any other extensions you want to use
      enabled-extensions = [ "dash-to-dock@micxgx.gmail.com" ];
    };

    # And here you can configure its settings
    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      # Add other settings from the dconf keys for the extension
      # For example:
      # background-opacity = 0.8;
      # dock-fixed = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      #button-layout = "close,minimize,maximize:";
      button-layout = ":minimize,maximize,close";
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [
        "org.gnome.Characters.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Contacts.desktop"
        "org.gnome.Documents.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Weather.desktop"
        "org.gnome.clocks.desktop"
      ];
    };
  };
}
