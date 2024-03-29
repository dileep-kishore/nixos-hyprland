# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  lib,
  pkgs,
  sops-nix,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    sops-nix.nixosModules.sops
  ];

  # Package mangement
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 15;
  boot.loader.systemd-boot.configurationLimit = 15;
  boot.supportedFilesystems = ["ntfs"];

  # amd gpu support for kernel
  boot.initrd.kernelModules = ["amdgpu"];

  networking.hostName = "tsuki"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = ["208.67.222.123" "208.67.220.123"];
  # networking.extraHosts =
  #  let
  #    hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/1a8e75f1cb6cd3b26ff028df83121f3d7b67b04c/alternates/porn/hosts;
  #    hostsFile = builtins.fetchurl {
  #      url = hostsPath;
  #      sha256 = "sha256:15vvv67piwmvgibjih8ifgs0q8z0pwsad5adyppijinq4fihwf4n";
  #    };
  #  in
  #  builtins.readFile "${hostsFile}";
  networking.extraHosts = ''
  '';

  # Set your time zone.
  time.timeZone = "America/New_York";
  # services.automatic-timezoned.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable nix-ld
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr
      rocmPackages.clr.icd
    ];
  };
  # tablet
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;

  # Load amd driver for Xorg and Wayland
  services.xserver.videoDrivers = ["amdgpu"];
  console.useXkbConfig = true;

  # Configure keymap in X11
  services.xserver = {
    wacom.enable = true;
    enable = true;
    xkb.options = "ctrl:nocaps";
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.gdm.enable = true;
  };

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Wacom

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dileep = {
    isNormalUser = true;
    description = "Dileep Kishore";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      swayidle
      swaylock-effects
    ];
  };
  # Default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [zsh];
  security.pam.services.swaylock = {};

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
    permittedInsecurePackages = [
      "electron-24.8.6"
      "electron-22.3.27"
      "electron-25.9.0"
      "zotero-6.0.27"
    ];

    # Create an alias for the unstable channel
    # packageOverrides = pkgs: {
    #   unstable = import <unstable> {
    #     config = config.nixpkgs.config;
    #   };
    # };
  };

  # hyprland
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  # 1password
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = ["dileep"];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Sops secrets
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/dileep/.config/sops/age/keys.txt";
  sops.secrets.OPENAI_API_KEY = {
    owner = config.users.users.dileep.name;
  };

  systemd.services."openaisecret" = {
    description = "OpenAI API Key";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
    script = ''
      mkdir -p /home/dileep/.secrets
      echo $(cat ${config.sops.secrets.OPENAI_API_KEY.path}) > /home/dileep/.secrets/openai_api_key.txt
    '';
    serviceConfig = {
      User = "dileep";
      WorkingDirectory = "/home/dileep";
    };
  };
  systemd.services.openaisecret.enable = true;

  fonts.fontDir.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.printing.enable = true;

  # vpn
  services.openvpn.servers = {
    homeVPN = {config = ''config /home/dileep/.nordvpn/us9565.nordvpn.com.udp.ovpn '';};
  };

  services = {
    syncthing = {
      enable = true;
      user = "dileep";
      dataDir = "/home/dileep/Documents"; # Default folder for new synced folders
      configDir = "/home/dileep/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;
  sound.enable = true;

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

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
  system.stateVersion = "23.05"; # Did you read the comment?
}
