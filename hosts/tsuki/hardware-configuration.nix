{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f9a11139-7c45-4be4-8b6a-dc21c3e733dc";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/79F5-B2F3";
    fsType = "vfat";
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/18be2346-1e32-4e51-816b-1c9a7cfbc20f";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/cda6801f-780c-499e-9ef9-1d8d09ea41c6";}
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
