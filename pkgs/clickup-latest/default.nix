{
  lib,
  appimageTools,
  fetchurl,
}: let
  pname = "clickup-latest";
  version = "3.5.64";

  src = fetchurl {
    url = "https://desktop.clickup.com/linux";
    hash = "sha256-eo1wz9tIDCDnO73KK/OYrV8zt3Y8oI3YK6ZXgMBGZ88=";
  };

  appimageContents = appimageTools.extractType2 {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraPkgs = pkgs: [pkgs.xorg.libxkbfile];

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/desktop.desktop $out/share/applications/clickup.desktop

      substituteInPlace $out/share/applications/clickup.desktop \
        --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=clickup' \
        --replace-fail 'Icon=desktop' 'Icon=clickup'

      for size in 16 32 64 128 256 512 1024; do
        install -Dm444 ${appimageContents}/usr/share/icons/hicolor/''${size}x''${size}/apps/desktop.png \
          -t $out/share/icons/hicolor/''${size}x''${size}/apps/clickup.png
      done
    '';

    meta = {
      description = "All in one project management solution";
      homepage = "https://clickup.com";
      license = lib.licenses.unfree;
      mainProgram = "clickup";
      maintainers = with lib.maintainers; [heisfer];
      platforms = ["x86_64-linux"];
    };
  }
