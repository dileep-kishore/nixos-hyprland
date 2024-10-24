{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5833237c-3f4b-4084-924e-e5dcbc83c197";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/2884-A426";
    fsType = "vfat";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/257a45a6-c4d9-4f1c-9c4e-72bf37f14d68";}
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
