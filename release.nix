{ sources ? import ./nix/sources.nix
}:

let
  hsPkgs = import ./default.nix { inherit sources; };

in {
  tree-sitter = hsPkgs.tree-sitter.components.all;
  tree-sitter-go = hsPkgs.tree-sitter-go.components.all;
  tree-sitter-haskell = hsPkgs.tree-sitter-haskell.components.all;
  tree-sitter-java = hsPkgs.tree-sitter-java.components.all;
  tree-sitter-json = hsPkgs.tree-sitter-json.components.all;
  tree-sitter-nix = hsPkgs.tree-sitter-nix.components.all;
  tree-sitter-php = hsPkgs.tree-sitter-php.components.all;
  tree-sitter-python = hsPkgs.tree-sitter-python.components.all;
  tree-sitter-ruby = hsPkgs.tree-sitter-ruby.components.all;
  tree-sitter-tsx = hsPkgs.tree-sitter-tsx.components.all;
  tree-sitter-typescript = hsPkgs.tree-sitter-typescript.components.all;
  tree-sitter-ql = hsPkgs.tree-sitter-ql.components.all;
  tree-sitter-verilog = hsPkgs.tree-sitter-verilog.components.all;
}
