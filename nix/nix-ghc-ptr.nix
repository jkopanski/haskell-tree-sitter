{
  hieVer = "ghc865";
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./pkgs/nixpkgs-unstable-20190922.json; };
}
