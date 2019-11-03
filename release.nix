{ withHoogle ? true
}:
let
  pinnedPkgs = (import ./nix/nix-ghc-ptr.nix).pinnedPkgs;
  hsLib = pinnedPkgs.haskell.lib;

  customHaskellPackages = pinnedPkgs.haskellPackages.override (old: {
    overrides = pinnedPkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
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
      tree-sitter-verilog = self.callCabal2nix "tree-sitter-verilog" ./tree-sitter-verilog {};
    });
  });

  hoogleAugmentedPackages = import ./nix/toggle-hoogle.nix {
    withHoogle = withHoogle;
    input = customHaskellPackages;
  };

in
  { tree-sitter = hoogleAugmentedPackages.tree-sitter;
    tree-sitter-go = hoogleAugmentedPackages.tree-sitter-go;
    tree-sitter-haskell = hoogleAugmentedPackages.tree-sitter-haskell;
    tree-sitter-java = hoogleAugmentedPackages.tree-sitter-java;
    tree-sitter-json = hoogleAugmentedPackages.tree-sitter-json;
    tree-sitter-nix = hoogleAugmentedPackages.tree-sitter-nix;
    tree-sitter-php = hoogleAugmentedPackages.tree-sitter-php;
    tree-sitter-python = hoogleAugmentedPackages.tree-sitter-python;
    tree-sitter-ruby = hoogleAugmentedPackages.tree-sitter-ruby;
    tree-sitter-tsx = hoogleAugmentedPackages.tree-sitter-tsx;
    tree-sitter-typescript = hoogleAugmentedPackages.tree-sitter-typescript;
    tree-sitter-verilog = hoogleAugmentedPackages.tree-sitter-verilog;
  }
