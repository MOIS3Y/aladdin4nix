# ▄▀█ █░░ ▄▀█ █▀▄ █▀▄ █ █▄░█ ▄▄ ▀█ █▀▀ ▄▀█ ▄▄ █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█ ▀
# █▀█ █▄▄ █▀█ █▄▀ █▄▀ █ █░▀█ ░░ █▄ █▀░ █▀█ ░░ █▄▀ ██▄ ▄█ █░█ ░█░ █▄█ █▀▀ ▄
# -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

{ stdenv
, fetchurl
, writeShellScript
, buildFHSEnv
, dpkg
, coreutils
, xorg
, fontconfig
, libGL
, ... }: 
  let 
    name = "aladdin-2fa-desktop";
    url = "https://www.aladdin-rd.ru/upload/downloads/aladdin-2fa";
    version = "1.2.0.23";
    builder = writeShellScript "builder.sh" ''
      source $stdenv/setup
      PATH=$dpkg/bin:$PATH
      ${dpkg}/bin/dpkg -x $src unpacked
      ${coreutils}/bin/cp -r unpacked/* $out/
    '';
    aladdin-2fa-desktop-dpkg = stdenv.mkDerivation {
      inherit builder;
      name = "aladdin-2fa-desktop-dpkg";
      src = fetchurl {
        url = "${url}/${name}-x64-${version}.deb";
        sha256 = "sha256-+9QUFG8PO/eN1sc9Z9K4tHEfuO1wXs4XYh/nVfcpAL0=";
      };
    };
  in {
  aladdin-2fa-desktop = buildFHSEnv {
    inherit name;
    targetPkgs = pkgs: [ aladdin-2fa-desktop-dpkg ];
    multiPkgs = pkgs: [
      dpkg
      fontconfig
      xorg.libX11
      xorg.libXrandr
      xorg.libXxf86vm
      xorg.libXi
      xorg.libXcursor
      xorg.libXinerama
      libGL
    ];
    runScript = "aladdin-2fa-desktop";
  };
}
