{ sources ? import ./nix/sources.nix
}:

let
  hsPkgs = import ./default.nix { inherit sources; };

in {
  tree-sitter = hsPkgs.tree-sitter;
  tree-sitter-go = hsPkgs.tree-sitter-go;
  tree-sitter-haskell = hsPkgs.tree-sitter-haskell;
  tree-sitter-java = hsPkgs.tree-sitter-java;
  tree-sitter-json = hsPkgs.tree-sitter-json;
  tree-sitter-nix = hsPkgs.tree-sitter-nix;
  tree-sitter-php = hsPkgs.tree-sitter-php;
  tree-sitter-python = hsPkgs.tree-sitter-python;
  tree-sitter-ruby = hsPkgs.tree-sitter-ruby;
  tree-sitter-tsx = hsPkgs.tree-sitter-tsx;
  tree-sitter-typescript = hsPkgs.tree-sitter-typescript;
  tree-sitter-ql = hsPkgs.tree-sitter-ql;
  tree-sitter-verilog = hsPkgs.tree-sitter-verilog;
}
