{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = ["208.67.222.123" "208.67.220.123"];
    extraHosts = let
      hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/b89d4aad707876e47dcdf66f32fb26cfbcffc4e1/alternates/porn-only/hosts";
      hostsFile = builtins.fetchurl {
        url = hostsPath;
        sha256 = "sha256:05k080gb334dvfcxaqgr8pdw8zjhanc7fg44wg6fpjrqc01wri51";
      };
    in
      builtins.readFile "${hostsFile}";
  };
}
