# ▄▀█ █░░ ▄▀█ █▀▄ █▀▄ █ █▄░█ █░█ █▄░█ █ ▀▄▀
# █▀█ █▄▄ █▀█ █▄▀ █▄▀ █ █░▀█ ▀▀█ █░▀█ █ █░█
# -- -- -- -- -- -- -- -- -- -- -- -- -- --

{
  description = ''
    DPKG version of aladdin-2fa-desktop for nixOS 
    or any distro if the Nix package manager is installed on it.
    Official site:
    https://www.aladdin-rd.ru/catalog/aladdin-2fa/
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    aladdin4nix = pkgs.callPackage ./aladdin-2fa-desktop {};
  in {
    packages.${system} = {
      aladdin4nix = aladdin4nix.aladdin-2fa-desktop;
      default = self.packages.x86_64-linux.aladdin4nix;
    };
  };
}
