{ sources ? import ./nix/sources.nix
}:

let
  # ghcide = import sources.ghcide {};
  pkgs = import sources.nixpkgs (import sources."haskell.nix");
  hsPkgs = import ./default.nix { inherit sources; };

in
  hsPkgs.shellFor {
    # Include only the *local* packages of your project.
    packages = ps: with ps; [
      tree-sitter
      tree-sitter-haskell
      tree-sitter-verilog
    ];

    # Builds a Hoogle documentation index of all dependencies,
    # and provides a "hoogle" command to search the index.
    withHoogle = true;

    # You might want some extra tools in the shell (optional).
    buildInputs = with pkgs.haskellPackages; [
      hlint
      stylish-haskell
      ghcid
      # ghcide.ghcide-ghc882
    ];

    # Prevents cabal from choosing alternate plans, so that
    # *all* dependencies are provided by Nix.
    exactDeps = true;
  }
