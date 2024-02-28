{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    copyq
    (ulauncher.overrideAttrs (previous: {
      propagatedBuildInputs =
        previous.propagatedBuildInputs
        ++ [
          python3Packages.requests
          python3Packages.pygithub
          python3Packages.pint
          python3Packages.simpleeval
          python3Packages.parsedatetime
          python3Packages.pytz
          python3Packages.todoist-api-python
        ];
    }))
  ];
}
