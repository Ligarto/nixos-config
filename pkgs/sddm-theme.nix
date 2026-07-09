# pkgs/sddm-theme.nix
{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation rec {
  pname = "sddm-noctalia-theme";
  version = "unstable-2026-07-06";

  src = fetchFromGitHub {
    owner = "mahaveergurjar";
    repo = "sddm";
    rev = "noctalia";
    hash = "sha256-e/gYI6znHXxlDCOVh4p265x3kO0nQUU897hCY1yEz88=";
  };

  wallpaper = ./Wall.jpg;

  dontBuild = true;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/sddm/themes/noctalia
    cp -r $src/* $out/share/sddm/themes/noctalia/

    chmod -R +w $out/share/sddm/themes/noctalia

    cp ${wallpaper} $out/share/sddm/themes/noctalia/Assets/Wall.jpg

    substituteInPlace $out/share/sddm/themes/noctalia/theme.conf \
      --replace "background=Assets/background.png" "background=Assets/Wall.jpg"

    if [ -f $out/share/sddm/themes/noctalia/theme.conf ]; then
      echo "fontScale=0.5" >> $out/share/sddm/themes/noctalia/theme.conf
      echo "scaleRatio=1.5" >> $out/share/sddm/themes/noctalia/theme.conf
    fi

    runHook postInstall
  '';

  meta = with lib; {
    description = "Noctalia/Rosé Pine SDDM theme (Qt6)";
    homepage = "https://github.com/mahaveergurjar/sddm/tree/noctalia";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
