{
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      # Hardware config
      inputs.hardware.nixosModules.dell-xps-15-9520-nvidia
      ./hardware-configuration.nix

      # Common config
      ../common/core

      # Optional configs
      ../common/optional/hyprland.nix
      ../common/optional/wacom.nix

      # User config
      ../common/users/dileep
    ]
    ++ (builtins.attrValues outputs.nixosModules);

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

  networking.hostName = "nixos-xps"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.xkbOptions = "ctrl:nocaps";
  console.useXkbConfig = true;
  hardware.bluetooth.enable = true;

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.options = "ctrl:nocaps";
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.gdm.enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      intelBusId = "PCI:0:02:0";
      nvidiaBusId = "PCI:1:00:0";
    };
  };

  system.stateVersion = "23.11";
}
