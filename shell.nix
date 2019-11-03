let
  ghcPtr = import ./nix/nix-ghc-ptr.nix;
  pinnedPkgs = ghcPtr.pinnedPkgs;
  myPackages = (import ./release.nix { withHoogle = true; } );
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
  # ghcide = import (fetchTarball "https://github.com/hercules-ci/ghcide-nix/tarball/ghc881") {};

  projectDrvEnv = myPackages.tree-sitter.env.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs ++ [
      pinnedPkgs.haskellPackages.cabal-install
      pinnedPkgs.haskellPackages.hlint
      pinnedPkgs.haskellPackages.ghcid
      all-hies.versions.${ghcPtr.hieVer}
      # ghcide.ghcide-ghc865
      ];
    shellHook = ''
      export HIE_HOOGLE_DATABASE="$NIX_GHC_LIBDIR/../../share/doc/hoogle/index.html"
    '';
  });
in
  projectDrvEnv
