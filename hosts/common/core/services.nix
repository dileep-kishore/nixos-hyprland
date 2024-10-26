{
  services = {
    openssh.enable = true;
    printing.enable = true;

    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    blueman.enable = true;
    gnome.gnome-keyring.enable = true;

    dbus.enable = true;

    flatpak.enable = true;
  };

  programs.gnome-disks.enable = true;
}
