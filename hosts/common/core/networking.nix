{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    # nameservers = ["208.67.222.123" "208.67.220.123"];
    nameservers = ["8.8.8.8" "8.8.4.4"];
    # extraHosts = let
    #   hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/1a8e75f1cb6cd3b26ff028df83121f3d7b67b04c/alternates/porn/hosts";
    #   hostsFile = builtins.fetchurl {
    #     url = hostsPath;
    #     sha256 = "sha256:15vvv67piwmvgibjih8ifgs0q8z0pwsad5adyppijinq4fihwf4n";
    #   };
    # in
    #   builtins.readFile "${hostsFile}";
  };
}
