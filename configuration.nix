# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import <nixpkgs-unstable> {};
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.extra-experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.variant = "";
    xkb.options = "grp:win_space_toggle";
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # Nvidia drivers
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shd = {
    isNormalUser = true;
    description = "shd";
    extraGroups = [ "networkmanager" "wheel" "docker"  ];
    packages = with pkgs; [];
  };

  # Wayland 
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

 programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };


 # Docker 
virtualisation.docker = {
     enable = true;
     enableOnBoot= true;
     # enableNvidia = true;
}; 

# services.ollama = {
#   enable = true;
#   acceleration = "cuda";
# };

virtualisation.docker.rootless = {
  enable = true;
  setSocketVariable = true;
};

qt = {
  enable = true;
  platformTheme = "gnome";
  style = "adwaita-dark";
};


# home-manager.users.myuser = {
#  dconf = {
#    enable = true;
#    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
#  };
#};

#  gtk = {
#    enable = true;
#    theme = {
#      name = "orchis-theme";
#      package = pkgs.orchis-theme;
#    };
#    iconTheme = {
#      name = "Adwaita";
#      package = pkgs.adwaita-icon-theme;
#    };
#    cursorTheme = {
#      name = "Adwaita";
#      package = pkgs.adwaita-icon-theme;
#    };
#  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # unstable.nerd-fonts.iosevka
    # unstable.nerd-fonts.hack
    
    ### THEME ###
    dconf
    adwaita-qt
    adwaita-qt6
    adwaita-icon-theme
    tokyonight-gtk-theme 
    lxappearance

    ### SYSTEM ###
    playerctl
    i3status
    sddm-sugar-dark
    picom
    zip
    xfce.tumbler
    unzip
    autotiling
    wpaperd
# clipboard
    haskellPackages.greenclip
    cliphist
    # screenshots
    maim
    slurp 
    grim  
# notications
    dunst
    mako
    # xrandr
    dmenu
    wofi
    unstable.hyprland
    waybar
    rofi

    ### CLI ###
    eza
    zoxide
    btop
    bat
    fd
    ripgrep
    fzf
    jq
    curlHTTP3
    wget
    unstable.yazi
    feh
    spicetify-cli
    chafa

    xclip
    wl-clipboard
    starship
    lazygit
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    fish
    git

    ### APPS ###
	unstable.ghostty
    unstable.zed-editor
    alacritty
    foot
    xfce.thunar
    chromium
    spotify
    neovim

    ### LANGUAGES ###
    # js
    nodejs_23

    # java
    temurin-bin-23
    maven
    gradle

    # rust
    cargo
    rustc

    # C/C++
    gcc           
    gnumake           
    pkg-config     # Tool to manage library paths
    cmake          
    clang          

    # Databases
    mongosh
    mongodb-ce
    minio
    postgresql
  ];

fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "Iosevka" "Hack" ]; })
  iosevka 
  hack-font
];

  # Desktop manager
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.displayManager.sddm.enable = true;
  # services.xserver.displayManager.sddm.enable = false;
  # services.xserver.windowManager.hyprland.enable = false;
  # services.xserver.desktopManager.hyprland.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}

