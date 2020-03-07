{ sources ? import ./nix/sources.nix
, withHoogle ? false
}:
let
  packages = final: prev: {
    haskellPackages = prev.haskellPackages.override (old: {
      overrides = final.lib.composeExtensions
        (old.overrides or (_: _: {}))
        (self: super: {
          tree-sitter = self.callCabal2nix "tree-sitter" ./tree-sitter {};
          tree-sitter-go = self.callCabal2nix "tree-sitter-go" ./tree-sitter-go {};
          tree-sitter-haskell = self.callCabal2nix "tree-sitter-haskell" ./tree-sitter-haskell {};
          tree-sitter-java = self.callCabal2nix "tree-sitter-java" ./tree-sitter-java {};
          tree-sitter-json = self.callCabal2nix "tree-sitter-json" ./tree-sitter-json {};
          tree-sitter-nix = self.callCabal2nix "tree-sitter-nix" ./tree-sitter-nix {};
          tree-sitter-php = self.callCabal2nix "tree-sitter-php" ./tree-sitter-php {};
          tree-sitter-python = self.callCabal2nix "tree-sitter-python" ./tree-sitter-python {};
          tree-sitter-ruby = self.callCabal2nix "tree-sitter-ruby" ./tree-sitter-ruby {};
          tree-sitter-tsx = self.callCabal2nix "tree-sitter-tsx" ./tree-sitter-tsx {};
          tree-sitter-typescript = self.callCabal2nix "tree-sitter-typescript" ./tree-sitter-typescript {};
          tree-sitter-ql = self.callCabal2nix "tree-sitter-ql" ./tree-sitter-ql {};
          tree-sitter-verilog = self.callCabal2nix "tree-sitter-verilog" ./tree-sitter-verilog {};
        });
    });
  };

  hoogle = final: prev: {
    haskellPackages =
      if withHoogle
      then prev.haskellPackages.override (old: {
        overrides = final.lib.composeExtensions
          (old.overrides or (_: _: {}))
          (self: super: {
            ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
            ghcWithPackages = self.ghc.withPackages;
          });
      })
      else
        prev.haskellPackages;
  };

  pkgs = import sources.nixpkgs { overlays = [ packages hoogle ]; };

in {
  tree-sitter = pkgs.haskellPackages.tree-sitter;
  tree-sitter-go = pkgs.haskellPackages.tree-sitter-go;
  tree-sitter-haskell = pkgs.haskellPackages.tree-sitter-haskell;
  tree-sitter-java = pkgs.haskellPackages.tree-sitter-java;
  tree-sitter-json = pkgs.haskellPackages.tree-sitter-json;
  tree-sitter-nix = pkgs.haskellPackages.tree-sitter-nix;
  tree-sitter-php = pkgs.haskellPackages.tree-sitter-php;
  tree-sitter-python = pkgs.haskellPackages.tree-sitter-python;
  tree-sitter-ruby = pkgs.haskellPackages.tree-sitter-ruby;
  tree-sitter-tsx = pkgs.haskellPackages.tree-sitter-tsx;
  tree-sitter-typescript = pkgs.haskellPackages.tree-sitter-typescript;
  tree-sitter-ql = pkgs.haskellPackages.tree-sitter-ql;
  tree-sitter-verilog = pkgs.haskellPackages.tree-sitter-verilog;
}
