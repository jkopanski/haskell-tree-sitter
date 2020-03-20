{ sources ? import ./nix/sources.nix
}:

let
  pkgs = import sources.nixpkgs (import sources."haskell.nix");
  haskell = pkgs.haskell-nix;

  pkgSet = haskell.mkCabalProjectPkgSet {
    plan-pkgs = import ./pkgs.nix;
    pkg-def-extras = [];
    modules = [];
  };

in
pkgSet.config.hsPkgs // { _config = pkgSet.config; }
