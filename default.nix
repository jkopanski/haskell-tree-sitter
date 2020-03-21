{ sources ? import ./nix/sources.nix
}:

let
  pkgs = import sources.nixpkgs (import sources."haskell.nix");
  haskell = pkgs.haskell-nix;

  pkgSet = haskell.mkCabalProjectPkgSet {
    plan-pkgs = import ./pkgs.nix;
    pkg-def-extras = [
      (hackage: {
        happy = hackage.happy."1.19.12".revisions.default;
      })
    ];
    modules = [
      { packages.happy.package.setup-depends = [pkgSet.config.hsPkgs.Cabal]; }
      { packages.hsc2hs.package.setup-depends = [pkgSet.config.hsPkgs.Cabal]; }
      { packages.pretty-show.package.setup-depends = [pkgSet.config.hsPkgs.Cabal]; }
    ];
  };

in
pkgSet.config.hsPkgs // { _config = pkgSet.config; }
