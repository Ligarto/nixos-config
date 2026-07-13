{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  makeWrapper,
  glib,
  nss,
  nspr,
  atk,
  at-spi2-atk,
  at-spi2-core,
  cairo,
  pango,
  gtk3,
  cups,
  dbus,
  expat,
  gdk-pixbuf,
  mesa,
  libdrm,
  libxkbcommon,
  vulkan-loader,
  alsa-lib,
  libx11,
  libxcomposite,
  libxdamage,
  libxext,
  libxfixes,
  libxrandr,
  libxcb,
  libxshmfence,
}:
stdenv.mkDerivation rec {
  pname = "brave-origin";
  version = "1.92.138";

  src = fetchurl {
    url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-origin_${version}_amd64.deb";
    hash = "sha256-38DTkrV6tQZ3vej23R8fXYZmWHbPVuqbO95g6vcsp44=";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    glib
    nss
    nspr
    atk
    at-spi2-atk
    at-spi2-core
    cairo
    pango
    gtk3
    cups
    dbus
    expat
    gdk-pixbuf
    mesa
    libdrm
    libxkbcommon
    vulkan-loader
    alsa-lib
    stdenv.cc.cc.lib
    libx11
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrandr
    libxcb
    libxshmfence
  ];
  # libqt5_shim.so / libqt6_shim.so are Brave's optional native-file-dialog
  # integration for KDE/Qt desktops — irrelevant on niri, dlopen'd only if
  # used. Rather than pull in the entirety of Qt5 *and* Qt6 as a dependency
  # for a feature you'll never trigger, tell autoPatchelf it's fine to
  # leave these specific ones unresolved.
  autoPatchelfIgnoreMissingDeps = [
    "libQt5Core.so.5"
    "libQt5Gui.so.5"
    "libQt5Widgets.so.5"
    "libQt6Core.so.6"
    "libQt6Gui.so.6"
    "libQt6Widgets.so.6"
  ];

  unpackPhase = ''
    dpkg-deb --fsys-tarfile $src | tar -x --no-same-permissions
  '';

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r opt usr $out/
      mkdir -p $out/bin
      makeWrapper $out/opt/brave.com/brave-origin/brave-origin $out/bin/brave-origin \
        --set CHROME_DEVEL_SANDBOX /run/wrappers/bin/brave-origin-chrome-sandbox

      mkdir -p $out/share/applications
      cat > $out/share/applications/brave-origin.desktop <<EOF
    [Desktop Entry]
    Version=1.0
    Name=Brave Origin
    GenericName=Web Browser
    Comment=Minimalist, privacy-focused edition of Brave
    Exec=$out/bin/brave-origin %U
    Terminal=false
    Icon=brave-origin
    Type=Application
    MimeType=text/html;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/about;x-scheme-handler/unknown;
    Categories=Network;WebBrowser;
    StartupWMClass=brave-origin
    EOF

      for size in 16 24 32 48 64 128 256; do
        mkdir -p $out/share/icons/hicolor/''${size}x''${size}/apps
        install -Dm444 opt/brave.com/brave-origin/product_logo_''${size}.png \
          $out/share/icons/hicolor/''${size}x''${size}/apps/brave-origin.png
      done

      runHook postInstall
  '';

  meta = with lib; {
    description = "Minimalist, privacy-focused edition of Brave";
    homepage = "https://brave.com/origin/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "brave-origin";
  };
}
