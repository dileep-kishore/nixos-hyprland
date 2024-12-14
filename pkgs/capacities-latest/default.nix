{
  lib,
  appimageTools,
  fetchurl,
}: let
  pname = "capacities-latest";
  version = "1.43.47";

  src = fetchurl {
    url = "https://capacities-desktop-app.fra1.cdn.digitaloceanspaces.com/Capacities-1.43.47.AppImage";
    hash = "sha256-0R0u+sU4KFARtrvK6iwbbUMRWrUf2tEwfkLWCokLHIg=";
  };

  appimageContents = appimageTools.extractType2 {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraPkgs = pkgs: [pkgs.xorg.libxkbfile];

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/capacities.desktop $out/share/applications/capacities.desktop

      substituteInPlace $out/share/applications/capacities.desktop \
        --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=capacities' \

      for size in 16 32 64 128 256 512 1024; do
        install -Dm444 ${appimageContents}/usr/share/icons/hicolor/''${size}x''${size}/apps/capacities.png \
          -t $out/share/icons/hicolor/''${size}x''${size}/apps/capacities.png
      done
    '';

    meta = {
      description = "A studio for your mind";
      homepage = "https://capacities.io";
      license = lib.licenses.unfree;
      mainProgram = "capacities";
      maintainers = with lib.maintainers; [dkishore];
      platforms = ["x86_64-linux"];
    };
  }
