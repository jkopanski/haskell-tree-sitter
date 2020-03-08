{ sources ? import ./nix/sources.nix
, withHoogle ? false
}:

let
  pkgs = import sources.nixpkgs {};
  myPackages = (import ./release.nix { inherit sources; withHoogle = true; } );
  ghcide = import sources.ghcide {};

  projectDrvEnv = myPackages.tree-sitter.env.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.haskellPackages.cabal-install
      pkgs.haskellPackages.hlint
      pkgs.haskellPackages.ghcid
      ghcide.ghcide-ghc865
      ];
    shellHook = ''
      export HIE_HOOGLE_DATABASE="$NIX_GHC_LIBDIR/../../share/doc/hoogle/index.html"
    '';
  });
in
  projectDrvEnv
